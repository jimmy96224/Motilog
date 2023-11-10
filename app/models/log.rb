class Log < ApplicationRecord

  belongs_to :instrument

  validates :date, presence: true
  validates :log, presence: true

end
