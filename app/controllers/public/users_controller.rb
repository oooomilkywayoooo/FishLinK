class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.all.page(params[:posts_page]).per(6)
    @reviews = @user.reviews.all.page(params[:reviews_page]).per(10)
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image)
  end
end
