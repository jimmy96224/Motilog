class Log < ApplicationRecord

  belongs_to :instrument
  
  validates :user_id,       presence: true
  validates :instrument_id, presence: true
  validates :date,          presence: true
  validates :log,           presence: true

end
