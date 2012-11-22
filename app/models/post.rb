class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  has_many :related_activities, class_name: 'Activity', as: :thing
  has_many :reviews, dependent: :destroy
  audited

  validates :title, presence: true
  validates :body, presence: true

  def truncated_body
    body.split("\n").first
  end
end
