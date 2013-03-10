class ModifyNameFieldsForUsers < ActiveRecord::Migration
  def up
    remove_column :users, :name
    add_column :users, :first_name, :string, after: :id
    add_column :users, :last_name, :string, after: :first_name
    add_column :users, :username, :string, after: :last_name
  end

  def down
    remove_column :users, :username
    remove_column :users, :last_name
    remove_column :users, :first_name
    add_column :users, :name, :string
  end
end
