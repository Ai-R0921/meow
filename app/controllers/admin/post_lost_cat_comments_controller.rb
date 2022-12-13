class Admin::PostLostCatCommentsController < ApplicationController
  def index
    @post_lost_cat_comments = PostLostCatComment.all
  end

  def destroy
    @post_lost_cat_comment = PostLostCatComment.find(params[:id])
    @post_lost_cat_comment.destroy
    redirect_to admin_post_lost_cat_comments_path
  end
end
