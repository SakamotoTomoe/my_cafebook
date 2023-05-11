class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])
    comment.update(comments_params)
    redirect_to admin_comments_path
  end

  private

  def comments_params
    params.require(:comment).permit(:comment)
  end
end
