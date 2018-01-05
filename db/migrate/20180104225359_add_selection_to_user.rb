class AddSelectionToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :developer, :boolean
  end
end
