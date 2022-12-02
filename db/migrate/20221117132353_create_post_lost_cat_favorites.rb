class CreatePostLostCatFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :post_lost_cat_favorites do |t|
      t.references :post_lost_cat, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
