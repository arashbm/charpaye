class RemoveNotificationEmailFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :notification_email
  end

  def down
    add_column :users, :notification_email, :string
  end
end
