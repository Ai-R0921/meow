class CreateRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationships do |t|
      t.references :user, foreign_key: true, null: false
      t.integer :follower_id, null: false
      t.integer :following_id, null: false

      t.timestamps
    end
  end
end
