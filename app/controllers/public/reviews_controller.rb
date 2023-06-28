class Public::ReviewsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index, :search]
  before_action :is_matching_login_user, only: [:edit, :update]


  def new
    @review = Review.new
    @keywords = Keyword.all
  end

  def create
    @review = Review.new(reviews_params)
    @review.user_id = current_user.id
    @keyword_ids = params[:review][:keyword_ids]
    if @review.save
      @keyword_ids[1..-1].each do |keyword_id|
        keyword = Keyword.find(keyword_id.to_i)
        @review.keywords << keyword #関連付ける
      end
      redirect_to review_path(@review.id)
    else
      @keywords = Keyword.all
      render "new"
    end
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def index
    @reviews = Review.page(params[:page]).order(created_at: :desc)
    @comments = Comment.new
  end

  def edit
    @review = Review.find(params[:id])
    @keywords = Keyword.all
  end

  def update
    @review = Review.find(params[:id])
    @review.user_id = current_user.id
    if @review.update(reviews_params)
      @review.keywords.destroy_all
      keyword_ids = params[:review][:keyword_ids]
      keyword_ids[1..-1].each do |keyword_id|
        keyword = Keyword.find(keyword_id.to_i)
        @review.keywords << keyword #関連付ける
      end
      redirect_to review_path(@review.id)
    else
      @keywords = Keyword.all
      render :edit
    end
  end

  def search
    if params[:searchword].present?
      @reviews = Review.where('caption LIKE ?', "%#{params[:searchword]}%")
      @searchword = params[:searchword]
    else
      @reviews = Review.all
    end
  end

  private

  def reviews_params
    params.require(:review).permit(:cafe_name, :address, :opening_hours, :day_off, :review, :image)
  end

  def is_matching_login_user
    review = Review.find(params[:id])
    user = review.user.id
    unless user == current_user.id
      redirect_to reviews_path
    end
  end
end
