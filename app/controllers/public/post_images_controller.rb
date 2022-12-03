class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all
    @all_ranks = PostImage.create_all_ranks
  end

  def show
    @post_image = PostImage.find(params[:id])
    @user = @post_image.user
    @post_image_comment = PostImageComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    @post_image.update(post_image_params)
    redirect_to post_image_path(@post_image)
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to my_page_path
  end

  def search
    @section_title = "「#{params[:search]}」の検索結果"
    @post_images = if params[:search].present?
                    PostImage.where('title LIKE ?', "%#{params[:search]}%")
                  else
                    @post_images = PostImage.all
                  end
  end

  private

  def post_image_params
    params.require(:post_image).permit(:user_id, :type_id, :image, :title, :body, :sex)
  end

end
