class Categorization < ActiveRecord::Base
  attr_accessible :name, :task_id, :user_id
  belongs_to :users
  belongs_to :tasks
end
