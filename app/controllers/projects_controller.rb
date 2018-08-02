class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:new, :create, :destroy, :edit]

  def index
    @header = "All Projects"
    @projects = Project.all.order("created_at DESC")
    render 'index'
  end

  def new
    @project = Project.new
    @project.tags.build
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save!
      build_tags
      flash[:info] = "Saved!"
      redirect_to root_path
    else
      flash[:alert] = "Error!"
    end
  end

  def me
    if current_user
      @header = "My Projects"
      @user = User.find(session[:user_id])
      @projects = @user.projects
      render 'index'
    end
  end

  def vote
    @vote = Vote.find_by(project_id: project_params[:id], user_id: current_user.id)
    if @vote
      @vote.destroy!
    else
      Vote.create!(project_id: project_params[:id], user_id: current_user.id)
    end
  end

  def voted
    @header = "My Upvotes"
    @projects = current_user.voted_projects
  end


  def destroy
  end

  private

  def build_tags
    # hacky AF
    params[:project][:tags][:name].split(/[\s,]+/).each do |t|
      tag = Tag.find_or_create_by(name: t)
      ProjectTag.find_or_create_by(project_id: @project.id, tag_id: tag.id)
    end
  end

  def project_params
    params.require(:project).permit(:id, :title, :description, :organization, :budget)
  end

end
