class Public::PostLostCatsController < ApplicationController
  def new
    @post_lost_cat = PostLostCat.new
  end

  def create
    @post_lost_cat = PostLostCat.new(post_lost_cat_params)
    @post_lost_cat.user_id = current_user.id
    if @post_lost_cat.save
      redirect_to post_lost_cats_path
    else
      render :new
    end
  end

  def index
    @post_lost_cats = PostLostCat.all
  end

  def show
    @post_lost_cat = PostLostCat.find(params[:id])
    @user = @post_lost_cat.user
    @post_lost_cat_comment = PostLostCatComment.new
  end

  def edit
    @post_lost_cat = PostLostCat.find(params[:id])
  end

  def update
    @post_lost_cat = PostLostCat.find(params[:id])
    @post_lost_cat.update(post_lost_cat_params)
    redirect_to post_lost_cat_path(@post_lost_cat)
  end

  def destroy
    @post_lost_cat = PostLostCat.find(params[:id])
    @post_lost_cat.destroy
    redirect_to my_page_path
  end

  private

  def post_lost_cat_params
    params.require(:post_lost_cat).permit(:user_id, :type_id, :image, :title, :body, :sex)
  end

end
