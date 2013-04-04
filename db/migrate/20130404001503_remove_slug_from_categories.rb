class RemoveSlugFromCategories < ActiveRecord::Migration
  def up
    remove_index :categories, :slug
    remove_column :categories, :slug
  end

  def down
    add_column :categories, :slug, :string
    add_index :categories, :slug, unique: true
  end
end
