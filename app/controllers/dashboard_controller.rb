class DashboardController < ApplicationController
  before_filter :authenticate_user!
  def show
    @activities = Activity.order('created_at DESC').limit(20)
    @posts = current_user.posts.order('updated_at DESC').limit(5)
  end
end
