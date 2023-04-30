class Public::SearchesController < ApplicationController

  def search
    if params[:word].present?
      @word = params[:word]
      @reviews = Review.where('cafe_name LIKE(?) OR address LIKE(?) OR opening_hours LIKE(?) OR review LIKE(?)', "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%", "%#{params[:word]}%")
      @searchword = params[:word]
    else
      @reviews = Review.all
    end
  end

  def keyword_search
    @keywords = Keyword.find(params[:keywords])
    @reviews = []
    @keywords.each do |keyword|
      @reviews = @reviews + keyword.reviews
    end
    @reviews.uniq
  end

end
