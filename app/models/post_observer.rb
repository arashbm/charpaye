class PostObserver < ActiveRecord::Observer
  def after_create(post)
    Activity.create(subject: post.user, thing: post, action: 'create', data: { audit_id: post.audits.last.id })
    # should send email
    # should send push notifications
  end

  def after_update(post)
    Activity.create(subject: post.audits.last.user, thing: post, action: 'update', data: { audit_id: post.audits.last.id })
    # should send email
    # should send push notifications
  end
end
