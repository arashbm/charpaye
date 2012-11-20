class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  has_many :reviews, dependent: :destroy
  audited

  def truncated_body
    body.split("\n").first
  end
end
