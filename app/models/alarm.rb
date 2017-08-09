class Alarm < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  belongs_to :activity

  validates :offset, :offset_type, :user_id, :responsible_id, :activity_id, presence: true
  validates :offset, numericality: true

  VALID_OFFSETS = ["minutes", "hours", "days"]
end
