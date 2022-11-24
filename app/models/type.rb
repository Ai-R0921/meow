class Type < ApplicationRecord
  has_many :post_images, dependent: :destroy
  has_many :post_lost_cats, dependent: :destroy
end
