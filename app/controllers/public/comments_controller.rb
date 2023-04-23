class Public::CommentsController < ApplicationController
  
  def create
    comment = Comment.new(comment_params)
    comment.save
    redirect_to reviews_path
  end
  
  private
  
  def comments_params
    params.require(:comment).permit(:user_id, :comment)
  end
end
