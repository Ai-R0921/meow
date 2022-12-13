class Admin::PostImageCommentsController < ApplicationController
  def index
    @post_image_comments = PostImageComment.all
    # @post_lost_cat_comments = PostLostCatComment.all
    # @all_comments = {}
    # @post_image_comments.each do |post_image_comment|
    #   @all_comments[post_image_comment.created_at] = post_image_comment
    # end
    # @post_lost_cat_comments.each do |post_lost_cat_comment|
    #   @all_comments[post_lost_cat_comment.created_at] = post_lost_cat_comment
    # end
    
    # @all_comments = @all_comments.sort.to_h.values
  end

  def destroy
    @post_image_comment = PostImageComment.find(params[:id])
    @post_image_comment.destroy
    redirect_to admin_post_image_comments_path
  end
end
