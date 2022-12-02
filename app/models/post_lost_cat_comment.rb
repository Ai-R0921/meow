class PostLostCatComment < ApplicationRecord
  belongs_to :post_lost_cat
  belongs_to :user
end
