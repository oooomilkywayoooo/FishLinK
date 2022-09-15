class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).per(12)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to admin_posts_path
  end
end
