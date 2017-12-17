class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
      session[:user_id] = @user.id
      flash[:info] = "Logged In."
    else
      redirect_to signup_path
      flash[:alert] = "Error Logging in"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
