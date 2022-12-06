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

    # PostImageをキーワード検索
    if params[:search].present?
      post_images = PostImage.where('title LIKE ?', "%#{params[:search]}%").or(PostImage.where('body LIKE ?', "%#{params[:search]}%"))
    else
      post_images = PostImage.all
    end

    # PostLostCatをキーワード検索
    if params[:search].present?
      post_lost_cats = PostLostCat.where('title LIKE ?', "%#{params[:search]}%").or(PostLostCat.where('body LIKE ?', "%#{params[:search]}%"))
    else
      post_lost_cats = PostLostCat.all
    end

    # ハッシュ
    # @post_imagesという空の箱を用意する
    @post_images = {}
    # 上の検索結果としてのpost_imagesをeachでひとつづつ取り出す
    post_images.each do |post_image|
      # @post_imagesにpost_imageを追加する
      @post_images[post_image.created_at] = post_image
    end
    post_lost_cats.each do |post_lost_cat|
      # @post_imagesにpost_lost_catを追加する
      @post_images[post_lost_cat.created_at] = post_lost_cat
    end

    # 日付順で並び替えを行い、htmlでeachできる形に変換する
    # { "2022-12-1" => post_image,"2022-11-25" => post_image,"2022-11-29" => post_lost_cat,}
    # sortをすると{["2022-11-25" => post_image],["2022-11-29" => post_lost_cat],["2022-12-1" => post_image]}
    # .to_h.valuesをすると[post_image,post_lost_cat,post_image]
    @post_images = @post_images.sort.to_h.values
    # 60-77行目までコピーしてタグ検索にも使用
  end

  private

  def post_image_params
    params.require(:post_image).permit(:user_id, :type_id, :image, :title, :body, :sex)
  end

end
