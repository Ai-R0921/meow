class Public::HomesController < ApplicationController
  def top
    @post_images = PostImage.order('id DESC').limit(6)
  end
end
