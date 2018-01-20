class TagsController < ApplicationController
  def show
    @header = "Tag: #{Tag.find(params[:id]).name}"
    @projects = Tag.find(params[:id]).projects
  end
end
