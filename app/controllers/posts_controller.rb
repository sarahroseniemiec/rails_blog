class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      user_id: session[:user_id],
      title: params[:post][:title],
      content: params[:post][:content]
    )
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
    @post.title = params[:post][:title]
    @post.content = params[:post][:content]
    if @post.save
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

end
