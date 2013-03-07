class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @post = Post.order('created_at DESC')
  end

  def delete
  end

  def show
    @post     = Post.find(params[:id])
    @comments = @post.comments
    @comment =  @post.comments.build
    session[:post_id] = @post.id
  end

  def update
  
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
