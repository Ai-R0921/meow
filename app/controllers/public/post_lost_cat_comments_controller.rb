class Public::PostLostCatCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:destroy]
  before_action :prevent_url, only: [:destroy]

  def create
    post_lost_cat = PostLostCat.find(params[:post_lost_cat_id])
    comment = current_user.post_lost_cat_comments.new(post_lost_cat_comment_params)
    comment.post_lost_cat_id = post_lost_cat.id
    comment.save
    redirect_to post_lost_cat_path(post_lost_cat)
  end

  def destroy
    if @post_lost_cat_comment.user_id == current_user.id
      @post_lost_cat_comment.destroy
      redirect_to post_lost_cat_path(params[:post_lost_cat_id])
    end
  end

  private

  def post_lost_cat_comment_params
    params.require(:post_lost_cat_comment).permit(:comment)
  end

  def set_user
    @post_lost_cat_comment = PostLostCatComment.find(params[:id])
  end

  def prevent_url
    if @post_lost_cat_comment.user_id != current_user.id
      redirect_to root_path
    end
  end
end
