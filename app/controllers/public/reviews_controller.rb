class Public::ReviewsController < ApplicationController
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review)
    else
      render 'new'
    end
  end

  def show
  end
  
  private
  
  def review_params
    params.require(:review).permit(:reviewimage, :title, :body, :item)
  end
end
