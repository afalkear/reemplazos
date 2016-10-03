class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  has_many :alarm
end
