class Type < ApplicationRecord
  has_many :post_images, dependent: :destroy
end
