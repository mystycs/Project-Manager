class AddFieldToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :completed, :integer
  end
end
