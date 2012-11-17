class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :name

      t.timestamps
    end
  end
end
