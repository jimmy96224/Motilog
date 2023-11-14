class Favorite < ApplicationRecord
  
  belongs_to :user
  belongs_to :diary
  
  validates :user_id, uniqueness: {scope: :post_image_id}
  
end
