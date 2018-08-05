class AddConfirmationFlowToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :username, :string
    add_column :users, :confirmed_at, :timestamp
  end
end
