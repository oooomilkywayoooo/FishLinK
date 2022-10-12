class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_post,only: [:edit]
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = @user.posts.all.page(params[:posts_page]).per(6)
    @reviews = @user.reviews.all.page(params[:reviews_page]).per(10)

  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end

  def quit
    @user = current_user
  end

  def out
    @user = User.find(params[:user_id])
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to '/'
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
