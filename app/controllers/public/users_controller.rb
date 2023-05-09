class Public::UsersController < ApplicationController

  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @reviews = current_user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    user.update(user_params)
    redirect_to user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :introduction)
  end
end
