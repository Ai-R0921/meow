class User < ApplicationRecord
  has_one_attached :profile_image
  has_many :post_images, dependent: :destroy
  has_many :post_lost_cats, dependent: :destroy
  has_many :post_image_comments, dependent: :destroy
  has_many :post_lost_cat_comments, dependent: :destroy
  has_many :post_image_favorites, dependent: :destroy
  has_many :post_lost_cat_favorites, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  
  # 一覧で
  has_many :followings, through: :relationships, source: :follower
  has_many :followers, through: :reverse_of_relationships, source: :following

  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  validates :user_name,length: { minimum: 1, maximum: 10 }
  validates :email,presence: true
  validates :password,presence: true, on: :create

  def following?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def post_count
    self.post_images.count + self.post_lost_cats.count
  end

  def self.guest
    find_or_create_by!(email: 'guest@sample.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.user_name = "Guest"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
