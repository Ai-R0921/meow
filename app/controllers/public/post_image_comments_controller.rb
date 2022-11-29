class Public::PostImageCommentsController < ApplicationController
  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_image_comments.new(post_image_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
  end
  
  private
  
  def post_image_comment_params
    params.require(:post_image_comment).permit(:comment)
  end
  
end
