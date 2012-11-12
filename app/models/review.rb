class Review < ActiveRecord::Base
  attr_accessible :comments, :negative, :positive, :post_id, :user_id
  belongs_to :user
  belongs_to :post
end
