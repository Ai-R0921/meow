class PostImageComment < ApplicationRecord
  belongs_to :post_image
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 50 }
end
