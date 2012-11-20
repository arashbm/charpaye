class UsersController < ApplicationController
  before_filter :get_users
  # GET /users
  # GET /users.json
  def index
    respond_with @visible_users
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = @visible_users.find(params[:id])
    respond_with @user
  end


  # GET /users/1/edit
  def edit
    @user = @editable_users.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = @editable_users.find(params[:id])
    if current_user.admin?
      @user.update_attributes(params[:user], as: :admin)
    else
      @user.update_attributes(params[:user])
    end
    respond_with @user
  end
  
  private
  def get_users
    @visible_users = current_user.visible_users
    @editable_users = current_user.editable_users
  end
end
