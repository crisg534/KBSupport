class CommentsController < ApplicationController
  def create
    @post     = Post.find(params[:post_id])
    @comment = @post.comments.build(:title =>params[:comment][:title],:comment =>params[:comment][:comment])
    if @comment.save
      redirect_to user_post_path(current_user, @post.id), notice: "has creado un nuevo post"
    else
      flash[:error] = "error"
      render :new
    end
  end

  def new
    @post     = Post.find(params[:post_id])
    @comment =  @post.comments.build
  end

  def destroy
    p "aaa"
    @post     = Post.find(params[:post_id])
    @comment  = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "has eliminado el comentario"
      redirect_to user_post_path(current_user, @post.id)
    else
      flash[:error] = "No se ha podido eliminar el comentario"
       redirect_to user_post_path(current_user, @post)
    end
  end
end
