class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def update
    if current_user.update(user_params)
      redirect_to edit_user_path(current_user)
      flash[:info] = "Profile Updated"
    end
  end

  def create
    @user = User.find_by(email: user_params[:email])
    @new_user = User.new(user_params)
    if @user
      redirect_to login_path
      flash[:info] = "An account already exists with this email. Please login"
    elsif !@user && @new_user.save
      @new_user.send_confirmation_email
      redirect_to login_path
      flash[:info] = "Click the link sent in the confirmation email to login."
    else
      redirect_to signup_path
      flash[:alert] = "Error Logging in"
    end
  end

  def edit
    @user = User.find(params[:id])
    if !current_user
      redirect_to login_path
      flash[:danger] = "Login before trying that"
    elsif current_user != @user
      redirect_to edit_user_path(current_user)
      flash[:danger] = "Not permitted to view others profiles, dude."
    end
  end

  def confirm
    @user = User.find_by(confirmation_token: params[:token])
    if @user.update_attributes(confirmed_at: DateTime.now)
      redirect_to login_path
      flash[:info] = "Confirmed! Log In."
    else
      redirect_to login_path
      flash[:danger] = "There was an error with your credentials"
    end
  end

  def forgot
  end

  def forgot_password
    @user = User.find_by(email: params[:email])
    if @user.send_reset_email
      redirect_to forgot_path
      flash[:info] = "Follow the link in the email to reset."
    else
      redirect_to forgot_path
      flash[:error] = "Error sending reset email."
    end
  end

  def reset
    # get
    @user= User.find_by(reset_token: params[:token])
  end

  def reset_password
    #post/patch
    @user = User.find_by(reset_token: params[:token])
    u = @user
    u.password = params[:user][:password]
    u.password_confirmation = params[:user][:password]
    if u.save
      flash[:info] = "Password successfully reset."
      redirect_to login_path
    else
      flash[:danger] = "There was en error resetting your password."
      redirect_to reset_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :developer, :years_experience, :website_url, :github_url, :username)
  end
end
