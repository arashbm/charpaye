class UserObserver < ActiveRecord::Observer
  def after_create(user)
    Activity.create(subject: user, thing: user, action: 'create')
    # should send email
    # should send push notifications
  end
end
