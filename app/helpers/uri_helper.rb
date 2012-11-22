module UriHelper
  def post_review_path(post, review)
    post_path(post, anchor: "review_#{review.id}")
  end

  def post_show_reviews_path(post)
    post_path(post, anchor: 'reviews')
  end
end
