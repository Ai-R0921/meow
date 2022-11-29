class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :type
  has_many :post_image_favorites, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy

  enum sex: {
    male: 0, female: 1, unknown: 2
  }

  def favorited_by?(user)
    post_image_favorites.exists?(user_id: user.id)
  end

end
