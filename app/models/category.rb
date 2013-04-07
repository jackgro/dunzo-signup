class Category < ActiveRecord::Base
  attr_accessible :name
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def tasks_by_date(date)
    tasks.where(date: date).order('position')
  end

  def set_category_uid
    self.category_uid = Digest::MD5.hexdigest("#{Time.now.to_s}-#{self.user.slug}-#{self.name}")
  end

  def destroyable?
    self.user.categories.count > 1
  end

end
