class Instrument < ApplicationRecord

  has_one_attached :instrument_image
  belongs_to :user

  validates :name, presence: true,  length: { in: 2..20 }
  validates :profile, length: { maximum: 100 }

  def get_instrument_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
