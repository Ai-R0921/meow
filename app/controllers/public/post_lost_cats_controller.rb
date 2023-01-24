class Public::PostLostCatsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :prevent_url, only: [:edit, :update, :destroy]

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
    @post_lost_cats = PostLostCat.published
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
    params.require(:post_lost_cat).permit(:user_id, :type_id, :image, :title, :body, :sex, :status)
  end

  def set_user
    @post_lost_cat = PostLostCat.find(params[:id])
  end

  def prevent_url
    if @post_lost_cat.user_id != current_user.id
      redirect_to root_path
    end
  end

end
