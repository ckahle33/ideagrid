class RemoveOrgAndBudgetFromProject < ActiveRecord::Migration[5.1]
  def change
    remove_column :projects, :budget, :integer
    remove_column :projects, :organization, :string
  end
end
