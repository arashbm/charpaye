class ReviewObserver < ActiveRecord::Observer
  def after_create(review)
    Activity.create(subject: review.user, thing: review, action: 'create')
    # should send email
    UserMailer.new_review(review.id).deliver
    # should send push notifications
  end
end
