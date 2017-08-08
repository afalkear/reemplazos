class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  has_many :alarm

  validates :name, :date, :start, :end, :responsible_id, presence: true

  def start_at
    "#{start.hour}:#{start.min}"
  end

  def end_at
    "#{self.end.hour}:#{self.end.min}"
  end
end
