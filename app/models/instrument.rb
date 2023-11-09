class Instrument < ApplicationRecord

  has_one_attached :instrument_image
  belongs_to :user
  has_many :mainteance_logs

  validates :name, presence: true,  length: { in: 2..20 }
  validates :profile, length: { maximum: 100 }
  validates :user, presence: true

  def get_instrument_image(width, height)
   unless instrument_image.attached?
   # unless instrument_image.nil?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    instrument_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
   end
    instrument_image.variant(resize_to_limit: [width, height]).processed
  end

end
