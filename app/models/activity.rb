class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  has_many :alarm

  validates :name, :date, :start, :end, :responsible_id, presence: true
end
