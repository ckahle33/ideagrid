class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :project_id
      t.integer :user_id
      t.integer :parent_id
      t.timestamps
    end
  end
end
