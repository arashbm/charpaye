class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  belongs_to :user
  has_many :reviews
end
