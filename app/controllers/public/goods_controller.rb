class Public::GoodsController < ApplicationController
  def create
    @good = Good.new(user_id: current_user.id, post_id: params[:post_id])
    @good.save
    redirect_to post_path(params[:post_id])
  end

  def destroy
    @good = Good.find_by(user_id: current_user.id, post_id: params[:post_id])
    @good.destroy
    redirect_to post_path(params[:post_id])
  end
end
