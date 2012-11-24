class Task < ActiveRecord::Base
  attr_accessible :name

  belongs_to :category
  # has_many :users, :through => :categories
end
