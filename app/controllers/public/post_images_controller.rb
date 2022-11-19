class Public::PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save!
      redirect_to post_images_path
    else
      render :new
    end
  end

  def index
    @post_images = PostImage.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def post_image_params
    params.require(:post_image).permit(:user_id, :type_id, :image, :title, :body, :sex)
  end

end
