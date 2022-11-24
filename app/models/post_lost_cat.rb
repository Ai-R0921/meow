class PostLostCat < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :type

  enum sex: {
    male: 0, female: 1, unknown: 2
  }
end
