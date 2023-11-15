class Diary < ApplicationRecord

  has_one_attached :diary_image
  acts_as_taggable_on :tags
  belongs_to :instrument
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :date, presence: true
  validates :title, presence: true
  validates :text, presence: true


def get_diary_image(width, height)
  if diary_image.attached?
    diary_image.variant(resize_to_limit: [width, height]).processed
  else
    ''
  end
end

def favorited_by?(user)
    favorites.exists?(user_id: user.id)
end

def self.search(query)
  where("title LIKE ? OR text LIKE ?", "%#{query}%", "%#{query}%")
end

end
