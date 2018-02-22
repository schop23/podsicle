class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment_user
      @comment.update(comment_params)
    else
      flash[:alert] = "Sorry, only the user that created this comment can edit it."
    end 
    redirect_to post_path(@post)
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
    else
      flash[:alert] = "Sorry, only the user that created this comment can delete it."
    end
    redirect_to post_path(@post)
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end

