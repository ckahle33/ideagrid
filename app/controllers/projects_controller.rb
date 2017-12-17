class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create, :destroy, :edit]

  def index
    @projects = Project.all.order("created_at DESC")
    render 'index'
  end

  def new
  end

  def edit
  end

  def update
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save!
      flash[:info] = "Saved!"
      redirect_to root_path
    else
      flash[:alert] = "Error!"
    end

  end

  def me
    if current_user
      @user = User.find(session[:user_id])
      @projects = @user.projects
      render 'index'
    end
  end

  def vote

  end


  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:id, :title, :description, :organization, :budget)
  end

end
