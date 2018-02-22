class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end 

  def edit
    @post = Post.find(params[:id])
  end 

  def create
    @post = current_user.posts.create(post_params)
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.update(post_params)
    else
      flash[:alert] = "Sorry, only the user that created this post can edit it."
    end
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user == @post.user
      @post.destroy
    else
      flash[:alert] = "Sorry, only the user that created this post can delete it."
    end
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:post, :subject, :review, :podcast_url)
  end

end
