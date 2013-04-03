class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:history, :slugged]

  attr_accessible :name
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def tasks_by_date(date)
    tasks.where(date: date).order('position')
  end

  def set_category_uid
    self.category_uid = Digest::MD5.hexdigest("#{self.user.slug}-#{self.name}")
    self.save
  end

end
