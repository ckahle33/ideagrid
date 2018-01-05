class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user.developer
        redirect_to profile_path
        session[:user_id] = @user.id
        flash[:info] = "Fill out a brief profile outlining your skills."
      else
      redirect_to root_path
      session[:user_id] = @user.id
      flash[:info] = "Logged In."
      end
    else
      redirect_to signup_path
      flash[:alert] = "Error Logging in"
    end
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :developer)
  end
end
