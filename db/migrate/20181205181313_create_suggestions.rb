class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :email
      t.text :feedback
      t.timestamps
    end
  end
end
