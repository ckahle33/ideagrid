class CommentsController < ApplicationController
  before_action :authenticate_user

  def create
    comment = Comment.new(body: comment_params[:comment][:body], project_id: comment_params[:id])
    if comment_params[:parent_id]
      c = Comment.find(comment_params[:parent_id])
      c.children.create(body: comment_params[:comment][:body], project_id: comment_params[:id])
    end
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
