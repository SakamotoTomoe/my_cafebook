class Public::HomesController < ApplicationController

  def top
  end

  def index
    @review = Review.find(params[:id])
    @keywords = Keyword.find(params[:keywords])
    @reviews = []
    @keywords.each do |keyword|
      @reviews = @reviews + keyword.reviews
    end
    @reviews.uniq
    #@reviews = Review.where("fruit LIKE ?", "%#{params[:keywords]}%")
  end

end
