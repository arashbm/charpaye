class AddNotificationEmailToUsers < ActiveRecord::Migration
  def up
    add_column :users, :notification_email, :string
    User.all.each do |u|
      u.update_attributes notification_email: u.email
    end
  end

  def down
    remove_column :users, :notification_email
  end
end
