class AddUniquenessIndexOnUsersAndCategories < ActiveRecord::Migration
  def up
    add_index :users, :slug, unique: true
    add_index :categories, :slug, unique: true
  end

  def down
    remove_index :users, :slug
    remove_index :categories, :slug
  end
end
