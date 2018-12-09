class IdeasController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :require_login, only: [:new, :create, :destroy, :edit]

  def index
    @header = "All Ideas"
    @ideas = Idea.all.order("created_at DESC")
    render 'index'
  end

  def new
    @idea = Idea.new
    @idea.tags.build
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
  end

  def create
    # raise 'hello'
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      @idea.image.attach(idea_params[:image])
      build_tags
      flash[:info] = "Saved!"
      redirect_to root_path
    else
      flash[:alert] = "Error!"
    end
  end

  def me
    if current_user
      @header = "My Ideas"
      @user = User.find(session[:user_id])
      @ideas = @user.ideas
      render 'index'
    end
  end

  def vote
    if current_user
      @vote = Vote.find_by(idea_id: idea_params[:id], user_id: current_user.id)
      if @vote
        @vote.destroy!
      else
        Vote.create!(idea_id: idea_params[:id], user_id: current_user.id)
      end
    else
      flash[:info] = "Please log in to vote"
      redirect_to login_path
    end
  end

  def voted
    @header = "My Upvotes"
    @ideas = current_user.voted_ideas
  end


  def destroy
    #todo
  end

  def explore
    @header = "All Ideas"
    @ideas = Idea.all.order("created_at DESC")
    render 'explore'
  end

  private

  def build_tags
    # hacky AF
    if params[:taggles].present?
      params[:taggles].each do |t|
        tag = Tag.find_or_create_by(name: t)
        IdeaTag.find_or_create_by(idea_id: @idea.id, tag_id: tag.id)
      end
    end
  end

  def idea_params
    params.require(:idea).permit(:id, :title, :description, :organization, :budget, :image)
  end

end
