class Admin::UsersController < ApplicationController

  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
    @comments = @user.comments
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :introduction, :is_deleted)
  end

end
