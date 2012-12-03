class User < ActiveRecord::Base
  devise :database_authenticatable, :omniauthable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :role, :remember_me,
    :uid, :provider, :first_name, :last_name, :image, as: :admin
  attr_accessible :email, :password, :password_confirmation, :remember_me, :uid,
    :provider, :first_name, :last_name, :image

  # should it nullify?
  has_many :posts, dependent: :destroy

  # activities this user been an object to
  has_many :related_activities, class_name: 'Activity', as: :thing

  # activities and actions this user has done (been a subject to).
  has_many :activities, foreign_key: "subject_id"

  validates :first_name, presence: true
  validates :last_name, presence: true

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

  def self.find_or_create_for_facebook_oauth(auth, current_user=nil)
    # if user is logged in, link facebook account with his current account
    user = current_user if current_user

    # User is not logged in. trying to find him in database
    # first we try to find if there is a user with same facebook uid
    user = User.find_by_facebook_uid(auth.info.uid) unless user

    # then we try to find him from his email
    user = User.find_by_email(auth.info.email) unless user 

    # then we try to find him by name
    user = User.find_by_first_name_and_last_name(auth.info.first_name, auth.info.last_name) unless user

    # This is a new user perhaps. creating an account
    user = User.create(password: Devise.friendly_token[0,20]) unless user

    # then we update this user's information
    
    # basic info:
    user.first_name           ||= auth.info.first_name
    user.last_name            ||= auth.info.last_name
    user.email                ||= auth.info.email
    user.image                ||= auth.info.image.sub('http:', 'https:')

    # facebook credentials
    user.facebook_token       ||= auth.credentials.token
    user.facebook_expires_at  ||= auth.credentials.expires_at
    user.facebook_uid         ||= auth.uid
    user.facebook_email       ||= auth.info.email
    user.facebook_image       ||= auth.info.image.sub('http:', 'https:')

    user
  end

  def name
    "#{first_name} #{last_name}"
  end
end
