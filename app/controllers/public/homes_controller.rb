class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.order('id DESC').limit(6)
    @post_lost_cats = PostLostCat.order('id DESC').limit(6)
    @type = Type.select("name", "id")
    type_search = params[:type_search]
    if type_search != nil
      @post_image = Type.find_by(id: type_search).post_images
    else
      @post_images = PostImage.order('id DESC').limit(6)
    end
  end
end
