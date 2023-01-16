class Public::PostLostCatFavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    post_lost_cat = PostLostCat.find(params[:post_lost_cat_id])
    post_lost_cat_favorite = current_user.post_lost_cat_favorites.new(post_lost_cat_id: post_lost_cat.id)
    post_lost_cat_favorite.save
    redirect_to post_lost_cat_path(post_lost_cat)
  end

  def destroy
    post_lost_cat = PostLostCat.find(params[:post_lost_cat_id])
    post_lost_cat_favorite = current_user.post_lost_cat_favorites.find_by(post_lost_cat_id: post_lost_cat.id)
    post_lost_cat_favorite.destroy
    redirect_to post_lost_cat_path(post_lost_cat)
  end
end
