class AddPrivateFlagToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :private, :boolean, default: false
  end
end
