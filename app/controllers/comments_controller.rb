class CommentsController < ApplicationController

  def index

  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params[:post_id]
    @comment.user_id = session[:user_id]

    if @comment.save
      flash[:notice] = "Your comment has been made."
      redirect_to :back
    else
      flash[:alert] = "There was a problem with your comment, please try again."
      redirect_to new_post_comment
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @user = @comment.user_id
    if @user == session[:user_id]
    else
      flash[:alert] = "You do not have access to this page"
      redirect_to root_path
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Your comment has been updated"
      redirect_to root_path
    else
      flash[:alert] = "There was a problem updating your post."
      redirect_to edit_post_comment_path(@comment)
    end

  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      flash[:notice] = "Your comment has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "Your comment could not be deleted."
      redirect_to edit_post_comment_path(@comment)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
