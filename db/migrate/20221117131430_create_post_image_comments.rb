class CreatePostImageComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_image_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post_image, foreign_key: true, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
