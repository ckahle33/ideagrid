class ChangeToIdeaIdInComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :project_id, :idea_id
  end
end
