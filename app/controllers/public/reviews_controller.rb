class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    review = Review.new(reviews_params)
    review.user_id = current_user.id
    review.save
    redirect_to review_path(review.id)
  end

  private

  def reviews_params
    params.require(:review).permit(:cafe_name, :address, :opening_hours, :day_off, :review)
  end
end
