class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image

  has_many :instruments,    dependent: :destroy
  has_many :logs,           dependent: :destroy
  has_many :diaries,        dependent: :destroy
  has_many :post_comments,  dependent: :destroy
  has_many :favorites,      dependent: :destroy
  
  # メールアドレスのバリデーション（1文字以上の英数字、@、1文字以上の英数字、ドット、1文字以上の英数字）
  validates :email,   presence: true, format: { with: /\A[a-zA-Z0-9]{1,}[@][a-zA-Z0-9]{1,}[.][a-zA-Z0-9]{1,}\z/ }, uniqueness: true
  validates :name,    presence: true,  length: { in: 2..20 }
  validates :profile, length: { maximum: 100 }
  validates :goal,    length: { maximum: 30 }


  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "guestuser"
    end
  end

  def guest_user?
    email == GUEST_USER_EMAIL
  end

end