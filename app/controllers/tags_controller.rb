class TagsController < ApplicationController
  def show
    @projects = Tag.find(params[:id]).projects
  end
end
