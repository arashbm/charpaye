class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_posts
  def index
    @posts = @visible_posts.all
    respond_with(@posts)
  end

  def show
    @post = @visible_posts.find(params[:id])
    respond_with(@post)
  end

  def new
    @post = @posts.new
    respond_with(@post)
  end

  def edit
    @post = @editable_posts.find(params[:id])
  end

  def create
    @post = @posts.new(params[:post])
    @post.save
    respond_with(@post)
  end

  def update
    @post = @editable_posts.find(params[:id])
    @post.update_attributes(params[:post])
    respond_with(@post)
  end

  def destroy
    @post = @editable_posts.find(params[:id])
    @post.destroy
    respond_with(@post)
  end

  private

  def get_posts
    @posts = current_user.posts
    @visible_posts = current_user.visible_posts
    @editable_posts = current_user.editable_posts
  end
end
