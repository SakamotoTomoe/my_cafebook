class Public::HomesController < ApplicationController

  def top
  end

  def index
    @review = Review.find(params[:id])
  end

end
