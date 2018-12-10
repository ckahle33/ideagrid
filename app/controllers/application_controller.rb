class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :user_voted?, :random_image

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue
    nil
  end

  def require_login
    redirect_to login_path unless current_user
  end

  def user_voted?(id)
    !!current_user.votes.find_by(idea_id: id) if current_user
  end

  def random_image
    @urls = [
      "https://source.unsplash.com/500x300/?nature,water",
      "https://source.unsplash.com/500x300/?city",
      "https://source.unsplash.com/500x300/?architechture",
      "https://source.unsplash.com/500x300/?tech",
    ].sample
  end

end
