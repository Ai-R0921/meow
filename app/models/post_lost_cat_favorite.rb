class PostLostCatFavorite < ApplicationRecord
  belongs_to :user
  belongs_to :post_lost_cat

  validates_uniqueness_of :post_lost_cat_id, scope: :user_id

end
