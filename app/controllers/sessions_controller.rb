class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.fname}!"
      redirect_to "/"
    else
      flash[:alert] = "Your email or password did not match, please try again"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

end
