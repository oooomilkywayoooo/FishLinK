class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:notice] = "ステータスを変更しました"
      redirect_to admin_user_path(user)
    else
      render :show
    end
  end

  private
    def user_params
      params.require(:user).permit(:is_active)
    end
end
