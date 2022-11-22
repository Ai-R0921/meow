class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :email, :is_deleted, :encrypted_password)
  end

end
