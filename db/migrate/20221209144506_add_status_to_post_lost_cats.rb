class AddStatusToPostLostCats < ActiveRecord::Migration[6.1]
  def change
    add_column :post_lost_cats, :status, :integer, default: 0, null: false
  end
end
