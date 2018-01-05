class AddFieldsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :years_experience, :integer
    add_column :users, :website_url, :string
    add_column :users, :github_url, :string
  end
end
