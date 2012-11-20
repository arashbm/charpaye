class Review < ActiveRecord::Base
  attr_accessible :comments, :content, :form
  belongs_to :user
  belongs_to :post

  validates :user, presence: true
end
