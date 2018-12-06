class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def create
    email = suggestion_params[:email].present? ? suggestion_params[:email] : current_user.email
    if  suggestion_params[:feedback]
      if Suggestion.create(email: email, feedback: suggestion_params[:feedback])
        redirect_to :root
        flash[:success] = "Thank you for your feedback!"
      else
        flash[:danger] = "There was an error saving your suggestion :("
        redirect_to new_suggestion_path
      end
    end
  end

  def suggestion_params
    params.require(:suggestion).permit!
  end
end
