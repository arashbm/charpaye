class ChangeUsersToMultipleAuthMethods < ActiveRecord::Migration
  def change
    rename_column :users, :uid, :facebook_uid

    # adding extra columns
    add_column :users, :facebook_email, :string
    add_column :users, :facebook_image, :string
    add_column :users, :facebook_expires_at, :string
    add_column :users, :facebook_token, :string
  end
end
