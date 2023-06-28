class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = current_user.comments.build(comments_params)
    if @comment.save
      redirect_to review_path(@comment.review.id)
    else
      @review = Review.find(@comment.review_id)
      render "public/reviews/show"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:comment, :review_id)
  end
end
