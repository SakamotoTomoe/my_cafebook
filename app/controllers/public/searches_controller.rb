class Public::SearchesController < ApplicationController

  def search
    @keywords = Keyword.all
  end

  def search_results
    if params[:word].present?
      @word = params[:word]
      @reviews = Review.where('cafe_name LIKE(?) OR address LIKE(?) OR opening_hours LIKE(?) OR review LIKE(?)', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
    elsif params[:keywords].present?
      @keywords = Keyword.find(params[:keywords])
      @reviews = []
      @keywords.each do |keyword|
        @reviews = @reviews + keyword.reviews
      end
      @reviews.uniq
    else
      @reviews = Review.all
    end
  end

end
