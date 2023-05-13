class Public::HomesController < ApplicationController

  def top
    @reviews = Review.all
    @comments = Comment.all
  end

  def index
    @review = Review.find(params[:id])
  end

end
