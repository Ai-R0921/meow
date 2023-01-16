class PostLostCatComment < ApplicationRecord
  belongs_to :post_lost_cat
  belongs_to :user
  
  validates :comment, presence: true, length: { maximum: 50 }
end
