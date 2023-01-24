class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :favorites]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    if @user == current_user
      return redirect_to my_page_path
    end

    @post_images = @user.post_images.published
    @post_lost_cats = @user.post_lost_cats.published
  end

  def my_page
    @user = current_user
    @post_images = @user.post_images.published
    @post_lost_cats = @user.post_lost_cats.published
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
    if @user.email == "guest@sample.com"
      @user.destroy
      redirect_to root_path
    else
      @user.update(is_deleted: true)
      reset_session
      redirect_to root_path
    end
  end

  def favorites
    @user = User.find(params[:id])
    favorites = PostImageFavorite.where(user_id: @user.id).pluck(:post_image_id)
    @post_image_favorites = PostImage.find(favorites)
    favorites_lost = PostLostCatFavorite.where(user_id: @user.id).pluck(:post_lost_cat_id)
    @post_lost_cat_favorites = PostLostCat.find(favorites_lost)
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :profile_image, :email, :is_deleted, :encrypted_password)
  end

  def set_user
    @user = current_user
  end

  def prevent_url
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path
    end
  end

end
