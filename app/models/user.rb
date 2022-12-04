class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :post_images, dependent: :destroy
  has_many :post_lost_cats, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :post_lost_cat_comments, dependent: :destroy
  has_many :post_image_favorites, dependent: :destroy
  has_many :post_lost_cat_favorites, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :following

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  # def follow(user_id)
  #   relationships.create(following_id: user_id)
  # end

  # def unfollow(user_id)
  #   relationships.find_by(following_id: user_id).destroy
  # end

  def following?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
