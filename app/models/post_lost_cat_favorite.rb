class PostLostCatFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_lost_cat
end
