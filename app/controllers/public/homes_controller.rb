class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.order('id DESC').limit(6)
    @post_lost_cats = PostLostCat.order('id DESC').limit(6)

    @type = Type.select("name", "id")
    type_search = params[:type_search]
    if type_search != nil
      searched_post_images = Type.find_by(id: type_search).post_images
    else
      searched_post_images = PostImage.order('id DESC').limit(6)
    end

    if type_search != nil
      searched_post_lost_cats = Type.find_by(id: type_search).post_lost_cats
    else
      searched_post_lost_cats = PostLostCat.order('id DESC').limit(6)
    end

    # if params[:type_search].present?
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
