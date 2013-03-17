class Task < ActiveRecord::Base
  attr_accessible :name, :complete, :date

  belongs_to :category
  has_many :users, :through => :categories

  acts_as_list
end
