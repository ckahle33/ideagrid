class CreateProjectTags < ActiveRecord::Migration[5.1]
  def change
    create_table :project_tags do |t|
      t.string :tag_id
      t.belongs_to :project, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
