class TagsController < ApplicationController
  def show
    @header = "Tag: #{Tag.find(params[:id]).name}"
    @ideas = Tag.find(params[:id]).projects
  end
end
