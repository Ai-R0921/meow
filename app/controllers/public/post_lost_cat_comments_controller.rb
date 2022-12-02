class Public::PostLostCatCommentsController < ApplicationController
  def create
    post_lost_cat = PostLostCat.find(params[:post_lost_cat_id])
    comment = current_user.post_lost_cat_comments.new(post_lost_cat_comment_params)
    comment.post_lost_cat_id = post_lost_cat.id
    comment.save
    redirect_to post_lost_cat_path(post_lost_cat)
  end

  def destroy
    PostLostCatComment.find(params[:id]).destroy
    redirect_to post_lost_cat_path(params[:post_lost_cat_id])
  end

  private

  def post_lost_cat_comment_params
    params.require(:post_lost_cat_comment).permit(:comment)
  end
end
