class PostsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @post = Post.order('created_at DESC')
  end

  def my_posts
    @post = current_user.post.order('created_at DESC')
  end

  def destroy
    @post     = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "has eliminado el post"
      redirect_to my_posts_user_posts_path(current_user)
    else
      flash[:notice] = "No se ha podido eliminar el post"
      redirect_to my_posts_user_posts_path(current_user)
    end
  end

  def show
    @post             = Post.find(params[:id])
    @comments         = @post.comments
    @comment          = @post.comments.build
    @user_equal_post  = @post.user_post_equal(current_user)
    session[:post_id] = @post.id
  end
  
  def edit
    @user = current_user
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Se ha actualizado el con exito"
      redirect_to user_post_path(@post.id)
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end
  
  def new
    @user = current_user
    @post = current_user.post.build
  end
  
  def create
    @post = current_user.post.build(params[:post])
    if @post.save
      redirect_to user_post_path(current_user, @post.id), notice: "has creado un nuevo post"
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def create_comment
    @post     = Post.find(session[:post_id])
    @comment = @post.comments.build(:title =>params[:comment][:title],:comment =>params[:comment][:comment], :user_id => params[:user_id])
    if @comment.save
      session.delete(:post_id)
      redirect_to user_post_path(current_user, @post.id), notice: "has creado un nuevo comentario"
    else
      flash[:error] = @comment.errors.full_messages.join(", ")
      redirect_to user_post_path(current_user, @post.id)
    end
  end

end
