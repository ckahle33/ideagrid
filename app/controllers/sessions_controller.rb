class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.where(params[:email]).first
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:info] = "Logged In."
    else
      flash[:alert] = "There was an error with your credentials"
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
