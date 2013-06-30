class Category < ActiveRecord::Base
  attr_accessible :name
  before_create :set_category_uid

  belongs_to :user
  has_many :tasks, dependent: :destroy

  def tasks_by_date(date)
    tasks.where(date: date).order('position ASC')
  end

  def set_category_uid
    self.category_uid = SecureRandom.hex(4)
  end

  def destroyable?
    self.user.categories.count > 1
  end

end
