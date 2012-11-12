class AuditionsController < ApplicationController
  before_filter authenticate_user!

  def index
    @audits = @posts.audits.all
  end

  def show
    if data = params[:id].match /\A(\d+)..(\d+)\z/
      range = (data[0]..data[1])
    else
      id = params[:id].to_i
      range = (id-1..id)
    end
    @audits = [@posts.audits.find(range.first),@posts.audits.find(range.last)]
  end

  private
  def get_post
    @post = current_user.visible_posts.find params[:post_id]
  end
end
