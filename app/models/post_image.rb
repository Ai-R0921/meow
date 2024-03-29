class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :type
  has_many :post_image_favorites, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy

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
     post_image_favorites.exists?(user_id: user.id)
  end

  def self.create_all_ranks
    PostImage.find(PostImageFavorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
  end
end
