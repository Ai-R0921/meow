class Public::PostImageFavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    post_image_favorite = current_user.post_image_favorites.new(post_image_id: @post_image.id)
    post_image_favorite.save
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    post_image_favorite = current_user.post_image_favorites.find_by(post_image_id: @post_image.id)
    post_image_favorite.destroy
  end
end
