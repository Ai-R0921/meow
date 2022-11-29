class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :post_images, dependent: :destroy
  has_many :post_lost_cats, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :post_image_favorites, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
