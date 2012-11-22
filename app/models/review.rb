class Review < ActiveRecord::Base
  attr_accessible :comments, :content, :form
  belongs_to :user
  belongs_to :post

  has_many :related_activities, class_name: 'Activity', as: :thing

  validates :user, presence: true
end
