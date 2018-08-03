class RenameProjectTagsToIdeaTags < ActiveRecord::Migration[5.2]
  def change
    rename_table :project_tags, :idea_tags
  end
end
