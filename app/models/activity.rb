class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  has_many :alarms

  DAYS_FOR_FULL_SCHEDULE = 14

  validates :name, :date, :start_hour, :end_hour, :responsible_id, presence: true
  validates_inclusion_of :start_hour, in: 0..24
  after_create set_default_alarms

  def start_at
    "#{start_hour}:#{start_minutes}"
  end

  def end_at
    "#{end_hour}:#{end_minutes}"
  end

  def set_default_alarms
    self.alarms.create(
      offset: 1, 
      offset_type: "day", 
      user_id: user.id, 
      responsible_id: responsible.id)
  end
end
