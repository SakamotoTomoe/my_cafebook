class Public::HomesController < ApplicationController

  def top
  end

  def index
    @reviews = Review.where("fruit LIKE ?", "%#{params[:fruit]}%")
  end

end
