class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :role,
    :notification_email, :remember_me, :uid, :provider, :first_name,
    :last_name, :image, as: :admin
  attr_accessible :email, :password, :password_confirmation, :notification_email,
    :remember_me, :uid, :provider, :first_name, :last_name, :image

  # should it nullify?
  has_many :posts, dependent: :destroy

  # activities this user been an object to
  has_many :related_activities, class_name: 'Activity', as: :thing

  # activities and actions this user has done (been a subject to).
  has_many :activities, foreign_key: "subject_id"

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :notification_email, presence: true

  def admin?
    # make it configurable!
    ['arashbm@gmail.com'].include? email
  end
  
  def member_of_editorial?
    role == '1'
  end

  def visible_users
    User.scoped
  end

  def editable_users
    if admin?
      User.scoped
    else
      User.where(id: id)
    end
  end

  def editable_posts
    if member_of_editorial? 
      Post.scoped
    else
      posts
    end
  end

  def visible_posts
    if member_of_editorial?
      Post.scoped
    else
      posts
    end
  end

  def self.find_or_new_for_facebook_oauth(auth, currently_signed_in_resource=nil)
    user = User.find_by_email(auth.info.email)
    unless user
      user = User.new(first_name: auth.info.first_name,
                      last_name: auth.info.last_name,
                      provider:auth.provider,
                      uid:auth.uid,
                      email:auth.info.email,
                      notification_email:auth.info.email,
                      password:Devise.friendly_token[0,20],
                      image: auth.info.image.sub('http:', 'https:'))
    end
    user
  end

  def name
    "#{first_name} #{last_name}"
  end
end
