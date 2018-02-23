class CommentsController < ApplicationController

  def new
 
    # params[:format] holds the post.id
    @post = Post.find(params[:format])
    @comment = Comment.new
  end

  def create
   
    # @post = Post.find(params[:post_id])
    # @comment = current_user.posts.comment.create!(comment_params)
    @comment = Comment.create!(comment_params.merge(user: current_user))
    
    redirect_to "/posts/#{params[:comment][:post_id]}"
  end

  def edit
    # @post = Post.find(params[:post_id])
    # puts 'IN EDIT !!!!!!!!!!!!!!!!!!!'
    # puts params
    @comment = Comment.find(params[:format])
    # puts '@COMMENT!!!!!!!!!!!!!'
    # puts @comment.id
  end

  def update
    # @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.update(comment_params)
    else
      flash[:alert] = "Sorry, only the user that created this comment can edit it."
    end 
    redirect_to "/posts/#{@comment.post.id}"
  end

  def destroy
    # @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
    else
      flash[:alert] = "Sorry, only the user that created this comment can delete it."
    end
    redirect_to "/posts/#{@comment.post.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
