class Public::HomesController < ApplicationController

  def top
    @reviews = Review.page(params[:page])
    @comments = Comment.all
  end

  def index
    @review = Review.find(params[:id])
  end

end
