class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    comment = current_user.comments.build(comments_params)
    comment.save
    redirect_to review_path(comment.review.id)
    if comment.save
      redirect_to review_path(comment.review.id) and return
    else
      redirect_to review_path(comment.review.id) and return
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:comment, :review_id)
  end
end
