class Feedback < ApplicationRecord
  belongs_to :user

  validates :subject, presence: true
  validates :content, presence: true

  scope :newest, (->{order(created_at: :desc).preload :user})
end
