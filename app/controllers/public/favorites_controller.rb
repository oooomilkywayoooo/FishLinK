class Public::FavoritesController < ApplicationController
  before_action :set_post, only: [:create, :destroy]
  before_action :authenticate_user!
  def index
    @favorites = Favorite.all
  end

  def create
    if @post.user_id != current_user.id
      @favorite = Favorite.create(user_id: @user.id, post_id: @post.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: @user.id, post_id: @post.id)
    @favorite.destroy
  end

  private
  def set_post
    @post = Post.find(params[:post_id])
  end
end
