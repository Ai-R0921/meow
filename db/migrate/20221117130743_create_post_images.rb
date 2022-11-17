class CreatePostImages < ActiveRecord::Migration[6.1]
  def change
    create_table :post_images do |t|
      t.references :user, foreign_key: true, null: false
      t.references :type, foreign_key: true, null: false
      t.string :image
      t.string :title, null: false
      t.text :body, null: false
      t.integer :sex, null: false, default: 0

      t.timestamps
    end
  end
end
