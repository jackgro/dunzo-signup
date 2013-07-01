class RenameCategoryToList < ActiveRecord::Migration
  def up
    remove_index :categories, :category_uid
    rename_column :categories, :category_uid, :uid

    rename_table :categories, :lists
    add_index :lists, :uid, unique: true

    rename_column :tasks, :category_id, :list_id
  end

  def down
    rename_column :tasks, :list_id, :category_id

    remove_index :lists, :uid
    rename_table :lists, :categories

    rename_column :categories, :uid, :category_uid
    add_index :categories, :category_uid, unique: true
  end
end
