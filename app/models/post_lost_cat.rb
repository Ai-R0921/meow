class PostLostCat < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :type
  has_many :post_lost_cat_comments, dependent: :destroy
  has_many :post_lost_cat_favorites, dependent: :destroy

  validates :image,presence: true
  validates :title, length: { maximum: 20 }
  validates :body, length: { maximum: 100 }

  enum sex: {
    male: 0, female: 1, unknown: 2
  }

  enum status: {
    published: 0, draft: 1
  }

  def favorited_by?(user)
    post_lost_cat_favorites.exists?(user_id: user.id)
  end

end
