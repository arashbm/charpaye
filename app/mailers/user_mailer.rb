# encoding: UTF-8
class UserMailer < ActionMailer::Base
  helper :posts
  default from: "notes@charpaye.herokuapp.com"

  def new_review(review_id)
    @review = Review.find(review_id)
    @reciever = @review.post.user
    mail to: @reciever.notification_email,
      subject: "[چارپایه] #{@review.user.name} نقدی برای مطلب «#{@review.post.title}» نوشت."
  end
end
