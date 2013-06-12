class RemoveTaskIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :task_id
  end

  def down
    add_column :categories, :task_id, :integer, default: nil
  end
end
