class Public::ReviewsController < ApplicationController

  def new
    @review = Review.new
    @keywords = Keyword.all
  end

  def create
    @review = Review.new(reviews_params)
    @review.user_id = current_user.id
    @keyword_ids = params[:review][:keyword_ids]
    if @review.save
      @keyword_ids[1..-1].each do |keyword_id|
        keyword = Keyword.find(keyword_id.to_i)
        @review.keywords << keyword #関連付ける
      end
      redirect_to review_path(@review.id)
    else
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def reviews_params
    params.require(:review).permit(:cafe_name, :address, :opening_hours, :day_off, :review)
  end
end
