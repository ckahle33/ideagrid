class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path
      flash[:info] = "Profile Updated"
    end
  end

  def create
    @user = User.where(email: user_params[:email]).first
    @new_user = User.new(user_params)
    if @user
      redirect_to login_path
      flash[:info] = "An account already exists with this email. Please login"
    elsif !@user && @new_user.save
      redirect_to profile_path
      session[:user_id] = @new_user.id
      flash[:info] = "Set a username"
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
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :developer, :years_experience, :website_url, :github_url)
  end
end
