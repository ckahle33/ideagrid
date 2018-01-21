class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save!
      current_user.comments << comment
      flash[:info] = "Comment Saved!"
      redirect_to project_path(comment_params[:project_id])
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :project_id)
  end
end
