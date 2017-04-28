class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = session[:user_id]

    if @post.save
      flash[:notice] = "You're post has been made."
      redirect_to user_path(session[:user_id])
    else
      flash[:alert] = "There was a problem with your post, please try again."
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @userpost = @post.user_id
    if @userpost == session[:user_id]
    else
      flash[:alert] = "You do not have access to this page"
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Your post has been updated."
      redirect_to user_path(session[:user_id])
    else
      flash[:alert] = "There was a problem updating your post, please try again."
      redirect_to edit_post_path(@post)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "Your post has been deleted."
      redirect_to user_path(session[:user_id])
    else
      flash[:alert] = "Your post could not be deleted."
      redirect_to edit_post_path(@post)
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
