class ChangeToIdeaId < ActiveRecord::Migration[5.2]
  def change
    rename_column :votes, :project_id, :idea_id
  end
end
