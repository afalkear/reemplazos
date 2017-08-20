class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  has_many :alarms

  DAYS_FOR_FULL_SCHEDULE = 14

  validates :name, :date, :start_hour, :end_hour, :responsible_id, presence: true
  validates_inclusion_of :start_hour, in: 0..24

  def start_at
    "#{start_hour}:#{start_minutes}"
  end

  def end_at
    "#{end_hour}:#{end_minutes}"
  end
end
