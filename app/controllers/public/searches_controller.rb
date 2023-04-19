class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end

  def search
    if params[:word].present?
      @reviews = Review.where('caption LIKE ?', "%#{params[:word]}%")
      @searchword = params[:word]
    else
      @reviews = Review.all
    end
  end

end
