class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user, dependent: :destroy
  has_many :reviews
  audited

  def truncated_body
    body.split("\n").first
  end
end
