class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:history, :slugged]

  attr_accessible :name
  belongs_to :user
  has_many :tasks, dependent: :destroy

  def tasks_by_date(date)
    tasks.where(date: date).order('position')
  end

  valid_email_regex = /\A[a-zA-Z0-9\s_\-]+\z/i
  validates :name, format: { with: valid_email_regex  }

end
