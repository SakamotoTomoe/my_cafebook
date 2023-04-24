class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    comment = current_user.comments.build(comments_params)
    comment.save
    redirect_to reviews_path
  end

  private

  def comments_params
    params.require(:comment).permit(:comment, :review_id)
  end
end
