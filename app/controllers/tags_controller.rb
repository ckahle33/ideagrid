class TagsController < ApplicationController
  def show
    @header = "Tag: #{Tag.find(params[:id]).name}"
    @ideas = Tag.find(params[:id]).ideas.visible.by_votes
  end
end
