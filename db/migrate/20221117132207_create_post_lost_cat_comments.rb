class CreatePostLostCatComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_lost_cat_comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :post_lost_cat, foreign_key: true, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
