class CreateCategoryProjects < ActiveRecord::Migration
  def change
    create_table :category_projects do |t|
      t.integer :category_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
