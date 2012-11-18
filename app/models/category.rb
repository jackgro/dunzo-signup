class Category < ActiveRecord::Base
  attr_accessible :name, :task_id, :user_id
  belongs_to :user
  has_many :tasks
end
