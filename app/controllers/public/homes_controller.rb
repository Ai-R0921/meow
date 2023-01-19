class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.order('id DESC').limit(4).published
    @post_lost_cats = PostLostCat.order('id DESC').limit(4).published

    @type = Type.select("name", "id").order("name asc") - [Type.find(28)] + [Type.find(28)]
    type_search = params[:type_search]
    if type_search != nil
      searched_post_images = Type.find_by(id: type_search).post_images.published
    end

    if type_search != nil
      searched_post_lost_cats = Type.find_by(id: type_search).post_lost_cats.published
    end

    if params[:type_search].present?
      @results = {}
      searched_post_images.each do |searched_post_image|
        @results[searched_post_image.created_at] = searched_post_image
      end

      searched_post_lost_cats.each do |searched_post_lost_cat|
        @results[searched_post_lost_cat.created_at] = searched_post_lost_cat
      end
      @results = @results.sort.to_h.values
    end
  end
  
  # def guest_sign_in
  #   user = User.find_or_create_by!(email: "guest@sample.com") do |user|
  #     user.password = SecureRandom.urlsafe_base64
  #     #user.skip_confirmation!
  #   end
  #   sign_in_user
  #   redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  # end
end
