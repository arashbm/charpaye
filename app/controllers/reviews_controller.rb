class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_post
  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = @post.reviews.all
    respond_with @post, @reviews
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = @post.reviews.find(params[:id])
    respond_with @post, @review
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = @post.reviews.where(user_id: current_user.id).create(params[:review])
    respond_with @post, @review
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = @post.reviews.where(user_id: current_user.id).find(params[:id])
    @review.update_attributes(params[:review])
    respond_with @post, @review
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = @post.reviews.where(user_id: current_user.id).find(params[:id])
    @review.destroy
    respond_with @post, @review
  end

  private
  def get_post
    @post = current_user.visible_posts.find(params[:post_id])
  end
end
