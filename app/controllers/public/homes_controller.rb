class Public::HomesController < ApplicationController

  def top
    @reviews = Review.page(params[:page]).order(created_at: :desc)
    @comments = Comment.page(params[:comment_page]).per(3).order(created_at: :desc)
  end
  
end
