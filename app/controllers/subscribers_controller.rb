class SubscribersController < ApplicationController

  def create
    if params[:subscriber][:email]
      if Subscriber.create(email: params[:subscriber][:email])
        flash[:success] = "Thanks for signing up!"
        redirect_to explore_path
      else
        flash[:danger] = "There was an error signing up!"
        redirect_to root_path
      end
    end
  end
end
