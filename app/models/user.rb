class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_image
  has_many :instruments, dependent: :destroy
  has_many :diaries, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :group_diaries, through: :groups, source: :diaries
  has_many :joined_groups_diaries, through: :groups, source: :diaries

  validates :name, presence: true,  length: { in: 2..20 }
  validates :profile, length: { maximum: 100 }

  def get_profile_image(width, height)
   unless profile_image.attached?
    file_path = Rails.root.join('app/assets/images/default_image.jpg')
    profile_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
   end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def join_group(group)
    groups << group unless groups.include?(group)
  end

  def leave_group(group)
    groups.delete(group)
  end

  def joined_groups_diaries
    Diary.where(user_id: group_diaries.select(:user_id))
  end

end
