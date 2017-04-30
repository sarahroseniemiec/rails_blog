class PostsController < ApplicationController
# controls the page for making a new post
  def new
    @post = Post.new
  end

# creates a new post and sets the user_id to the current user's id.
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

# controls the page to edit a post and finds the post from the url then checks to see if the post belongs to the person logged in if it does they can edit their post, if not they are redirected because I don't want a user to edit a different user's post.
  def edit
    @post = Post.find(params[:id])
    @userpost = @post.user_id
    if @userpost == session[:user_id]
    else
      flash[:alert] = "You do not have access to this page"
      redirect_to root_path
    end
  end

# updates a post
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

# deletes a post
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
# strong params
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
