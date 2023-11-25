class PostComment < ApplicationRecord
  
  belongs_to :user
  belongs_to :diary
  
  validates :user_id,   presence: true
  validates :diary_id,  presence: true
  validates :comment,   presence: true
  
end
