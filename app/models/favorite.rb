class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :diary

  validates :user_id,   presence: true, uniqueness: {scope: :diary_id}
  validates :diary_id,  presence: true

end
