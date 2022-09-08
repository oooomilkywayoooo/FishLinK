class Public::FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :authenticate_user!

  def index
    favorites = Favorite.where(user_id: current_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)
  end

  def create
    if @post.user_id != current_user.id
      favorite = current_user.favorites.build(post_id: params[:post_id])
      favorite.save
      redirect_to post_path(params[:post_id])
    end
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], user_id: current_user.id)
    favorite.destroy
    redirect_to post_path(params[:post_id])
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
