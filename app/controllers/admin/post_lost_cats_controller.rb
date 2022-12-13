class Admin::PostLostCatsController < ApplicationController
  def index
    @post_lost_cats = PostLostCat.published
  end

  def show
    @post_lost_cat = PostLostCat.find(params[:id])
    @user = @post_lost_cat.user
  end

  def destroy
    @post_lost_cat = PostLostCat.find(params[:id])
    @post_lost_cat.destroy
    redirect_to admin_post_lost_cats_path
  end
end
