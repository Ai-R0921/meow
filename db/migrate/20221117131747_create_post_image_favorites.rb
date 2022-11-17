class CreatePostImageFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :post_image_favorites do |t|
      t.references :post_image, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
