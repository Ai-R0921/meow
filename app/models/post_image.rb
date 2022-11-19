class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :type

  enum sex: {
    male: 0, female: 1
  }

end
