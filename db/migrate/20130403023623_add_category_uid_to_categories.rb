class AddCategoryUidToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :category_uid, :string
  end
end
