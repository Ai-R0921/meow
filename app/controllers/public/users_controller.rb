class Public::UsersController < ApplicationController
before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
    @currentUserEntry = Entry.where(user_id: current_user.id)
    @userEntry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def my_page
    @user = current_user
    @post_images = @user.post_images.published
    @post_lost_cats = @user.post_lost_cats
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

end
