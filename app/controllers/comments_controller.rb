class CommentsController < ApplicationController
  before_action :authenticate_user
  skip_before_action :verify_authenticity_token

  def create
    # raise ''
    comment = Comment.new(body: comment_params[:comment][:body], project_id: comment_params[:id], parent_id: comment_params[:comment][:parent_id])
    if comment.save!
      current_user.comments << comment
      flash[:info] = "Comment Saved!"
      redirect_to project_path(comment_params[:id])
    end
  end

  def authenticate_user
    unless current_user
      redirect_to login_path
      flash[:info] = "Please log in to comment"
    end
  end

  def comment_params
    params.permit(:id, {comment: [:body, :parent_id]})
  end
end
