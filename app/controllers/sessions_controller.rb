class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.where(email: session_params[:email].downcase).first
    if @user && !@user.confirmed_at
      redirect_to login_path
      flash[:info] = "Please confirm your account before logging in."
    elsif @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
      flash[:info] = "Logged In."
    else
      flash[:danger] = "Can't find a user with those credentials"
      redirect_to login_path
    end
  end

  def oauth
    user = User.find_by(email: auth_hash.info.name)
    if user
      session[:user_id] = user.id
      @current_user = user
      redirect_to :root
    else
      user = User.new(email: auth_hash.info.name, username: auth_hash.info.name, password: auth_hash['credentials']['token'], password_confirmation: auth_hash['credentials']['token'])
      if user.save!
        session[:user_id] = user.id
        @current_user = user
        redirect_to :root
      else
        flash['alert-danger'] = "there was an error trying to create your account"
        redirect_to :root
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def session_params
    params.require(:user).permit(:password, :email)
  end
end
