class Public::PostImageFavoritesController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    post_image_favorite = current_user.post_image_favorites.new(post_image_id: post_image.id)
    post_image_favorite.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    post_image = PostImage.find(params[:post_image_id])
    post_image_favorite = current_user.post_image_favorites.find_by(post_image_id: post_image.id)
    post_image_favorite.destroy
    redirect_to post_image_path(post_image)
  end
end
