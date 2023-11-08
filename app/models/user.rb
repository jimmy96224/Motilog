class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :instruments, dependent: :destroy

  validates :name, presence: true,  length: { in: 2..20 }
  validates :profile, length: { maximum: 100 }

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def get_instrument_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    instrument_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
   end
    instrument_image.variant(resize_to_limit: [width, height]).processed
  end

end
