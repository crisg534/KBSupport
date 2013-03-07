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
end
