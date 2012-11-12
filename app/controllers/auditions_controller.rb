class AuditionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_post

  def index
    @audits = @post.audits.all
  end

  def show
    @audit = @post.audits.find(params[:id])
  end

  private
  def get_post
    @post = current_user.visible_posts.find params[:post_id]
  end
end
