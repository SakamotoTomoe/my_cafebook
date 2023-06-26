class Admin::ReviewsController < ApplicationController

  before_action :authenticate_admin!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
    @keywords = Keyword.all
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(reviews_params)
      @review.keywords.destroy_all
      keyword_ids = params[:review][:keyword_ids]
      keyword_ids[1..-1].each do |keyword_id|
        keyword = Keyword.find(keyword_id.to_i)
        @review.keywords << keyword #関連付ける
      end
      redirect_to admin_review_path(@review.id)
    else
      @keywords = Keyword.all
      render :edit
    end
  end

  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end

  private

  def reviews_params
    params.require(:review).permit(:cafe_name, :address, :opening_hours, :day_off, :review)
  end

end
