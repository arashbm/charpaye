# encoding: UTF-8
class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_or_create_for_facebook_oauth(request.env["omniauth.auth"], current_user)

    if @user.changed?
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      @user.save
      sign_in @user
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      redirect_to edit_user_path(@user)
    else
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    end
  end
end
