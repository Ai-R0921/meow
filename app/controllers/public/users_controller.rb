class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def my_page
    @user = current_user
    @post_images = @user.post_images
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
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = PostImageFavorite.where(user_id: @user.id).pluck(:post_image_id)
    @post_image_favorites = PostImage.find(favorites)
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :email, :is_deleted, :encrypted_password)
  end

end
