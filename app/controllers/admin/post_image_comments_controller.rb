class Admin::PostImageCommentsController < ApplicationController
  def index
    @post_image_comments = PostImageComment.all
  end

  def destroy
    @post_image_comment = PostImageComment.find(params[:id])
    @post_image_comment.destroy
    redirect_to admin_post_image_comments_path
  end
end
