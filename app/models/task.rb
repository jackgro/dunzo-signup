class Task < ActiveRecord::Base
  attr_accessible :name, :complete, :date

  belongs_to :list
  has_many :users, :through => :lists

  acts_as_list
end
