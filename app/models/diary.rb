class Diary < ApplicationRecord

  has_one_attached :diary_image
  belongs_to :instrument
  belongs_to :user
  # has_many :diary_tags,dependent: :destroy
  # has_many :tags,through: :diary_tags

  validates :date, presence: true
  # validates :instrument, presence: true
  validates :title, presence: true
  validates :text, presence: true

def get_diary_image(width, height)
  if diary_image.attached?
    diary_image.variant(resize_to_limit: [width, height]).processed
  else
    ''
  end
end
# def get_diary_image(width, height)
#   if diary_image.attached?
#     diary_image.variant(resize_to_limit: [width, height]).processed
#   else
#     # Return a placeholder or handle the case when no image is attached
#     # For now, returning nil to indicate that there is no image attached.
#     nil
#   end
# end

  # def get_diary_image(width, height)
  #   unless diary_image.attached?
  #   file_path = Rails.root.join('app/assets/images/default_image.jpg')
  #   diary_image.attach(io: File.open(file_path), filename: 'default_image.jpg', content_type: 'image/jpeg')
  #   end
  #   diary_image.variant(resize_to_limit: [width, height]).processed
  # end

  # def save_tag(sent_tags)
  # # タグが存在していれば、タグの名前を配列として全て取得
  #   current_tags = self.tags.pluck(:name) unless self.tags.nil?
  #   # 現在取得したタグから送られてきたタグを除いてoldtagとする
  #   old_tags = current_tags - sent_tags
  #   # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
  #   new_tags = sent_tags - current_tags

  #   # 古いタグを消す
  #   old_tags.each do |old|
  #     self.tags.delete　Tag.find_by(name: old)
  #   end

  #   # 新しいタグを保存
  #   new_tags.each do |new|
  #     new_post_tag = Tag.find_or_create_by(name: new)
  #     self.tags << new_post_tag
  # end
  # end

end
