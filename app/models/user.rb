class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :omniauthable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation,
    :remember_me, :uid, :provider, :first_name, :last_name, :image
  has_many :posts
  
  def editable_posts
    posts
  end

  def visible_posts
    Post.scoped
  end

  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
    user = User.find_by_email(auth.info.email)
    unless user
      user = User.create(first_name: auth.info.first_name,
                         last_name: auth.info.last_name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20],
                         image: auth.info.image)
    end
    user
  end

  def name
    "#{first_name} #{last_name}"
  end
end
