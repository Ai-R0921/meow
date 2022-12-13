class PostImageComment < ApplicationRecord
  belongs_to :post_image
  belongs_to :user
  
  
end
