class AddCategoryUidToCategories < ActiveRecord::Migration
  def up
    add_column :categories, :category_uid, :string

    User.find_each do |user|
      user.categories.each do |category|
        category.set_category_uid
        category.save
      end
    end
  end

  def down
    remove_column :categories, :category_uid
  end
end
