class RenameProjectsToIdeas < ActiveRecord::Migration[5.2]
  def change
    rename_table :projects, :ideas
  end
end
