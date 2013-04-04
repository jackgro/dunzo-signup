class IndexCategoriesOnCategoryUid < ActiveRecord::Migration
  def up
    add_index :categories, :category_uid, unique: true
  end

  def down
    remove_index :categories, :category_uid
  end
end
