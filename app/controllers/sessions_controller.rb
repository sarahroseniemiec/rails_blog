class SessionsController < ApplicationController
  
# controls sign in page
  def new

  end

# signs a person in if their email and password are correct
  def create
    @user = User.where(email: params[:email]).first
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      flash[:notice] = "Welcome, #{@user.fname.capitalize}!"
      redirect_to root_path
    else
      flash[:alert] = "Your email or password did not match, please try again"
      redirect_to new_session_path
    end
  end

  # signs out a user
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
