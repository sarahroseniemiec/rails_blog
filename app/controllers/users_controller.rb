class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.find_by(email: params[:user][:email])
      flash[:alert] = "That email already exists please login or use a different email address."
      redirect_to new_user_path
    else
      @user = User.new(user_params)
      if @user.save
        @user = User.where(email: params[:user][:email]).first
        session[:user_id] = @user.id
        flash[:notice] = "Welcome #{@user.fname.capitalize}!"
        redirect_to root_path
      else
        flash[:alert] = "There was a problem with the signup please try again. Password must be at least 5 characters in length."
        redirect_to new_user_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts
  end

  def edit
    @user = User.find(params[:id])
    if params[:id].to_i == session[:user_id]
    else
      flash[:alert] = "You do not have access to this page"
      redirect_to root_path
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Your account has been updated"
      redirect_to user_path(@user)
    else
      flash[:alert] = "There was a problem updating your account, please try again."
      redirect_to edit_user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Your account has been deleted."
    else
      flash[:alert] = "The account could not be deleted."
    end
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :fname, :lname)
  end


end
