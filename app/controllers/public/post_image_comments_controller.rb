class Public::PostImageCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:destroy]
  before_action :prevent_url, only: [:destroy]

  def create
    post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_image_comments.new(post_image_comment_params)
    comment.post_image_id = post_image.id
    comment.save
    redirect_to post_image_path(post_image)
  end

  def destroy
    if @post_image_comment.user_id == current_user.id
      @post_image_comment.destroy
      redirect_to post_image_path(params[:post_image_id])
    end
  end

  private

  def post_image_comment_params
    params.require(:post_image_comment).permit(:comment)
  end

  def set_user
    @post_image_comment = PostImageComment.find(params[:id])
  end

  def prevent_url
    if @post_image_comment.user_id != current_user.id
      redirect_to root_path
    end
  end

end
