class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  has_many :reviews, dependent: :destroy
  audited

  validates :title, presence: true
  validates :body, presence: true

  def importance_to(user)
    1 * user.importance_to(user)
  end

  def truncated_body
    body.split("\n").first
  end
end
