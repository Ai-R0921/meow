class AddStatusToPostImages < ActiveRecord::Migration[6.1]
  def change
    add_column :post_images, :status, :integer, default: 0, null: false
  end
end
