class RemoveCategorizations < ActiveRecord::Migration
  def up
    drop_table :categorizations
  end

  def down
    create_table :categorizations do |t|
      t.integer :user_id
      t.integer :task_id
      t.string :name

      t.timestamps
    end

  end
end
