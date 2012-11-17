class Task < ActiveRecord::Base
  attr_accessible :name

  has_many :categorizations
  has_many :users, :through => :categorizations
end
