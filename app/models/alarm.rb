class Alarm < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  belongs_to :activity
end
