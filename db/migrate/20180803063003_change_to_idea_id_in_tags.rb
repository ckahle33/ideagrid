class ChangeToIdeaIdInTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :idea_tags, :project_id, :idea_id
  end
end
