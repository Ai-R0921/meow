class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  enum sex: {
    male: 0, female: 1
  }

end
