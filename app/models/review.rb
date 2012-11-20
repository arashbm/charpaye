class Review < ActiveRecord::Base
  attr_accessible :comments, :content, :form
  belongs_to :user
  belongs_to :post

  validates :user, presence: true

  def importance_to(user)
    1 * user.importance_to(user) * post.importance_to(user)
  end
end
