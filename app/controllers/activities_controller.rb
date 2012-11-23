class ActivitiesController < ApplicationController
  def show
    @activities = Activity.order('created_at DESC').limit(20)
    respond_with @activities
  end
end
