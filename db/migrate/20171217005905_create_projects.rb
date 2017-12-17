class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.integer :budget
      t.integer :user_id
      t.string :organization
      t.timestamps
    end
  end
end
