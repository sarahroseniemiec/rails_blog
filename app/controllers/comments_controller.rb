class CommentsController < ApplicationController

  def index

  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(
    post_id: params[:post_id],
    user_id: session[:user_id],
    content: params[:comment][:content]
    )
    if @comment.save
      flash[:notice] = "Your comment has been made."
      redirect_to "/"
    else
      flash[:alert] = "There was a problem with your comment, please try again."
      redirect_to new_post_comment
    end
  end

  

end
