class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :is_matching_login_user, only: [:edit, :update]

  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @reviews = current_user.reviews
  end

  def edit
    @user = current_user
  end

  def update
    user = User.find(params[:id])
    if user.email == 'guest@example.com'
      redirect_to user_path(user.id)
    elsif user == current_user
      user.update(user_params)
      redirect_to user_path(user.id)
    else
      redirect_to user_path(user.id)
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :introduction, :image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to root_path
    end
  end

end
