class Responsible < ApplicationRecord
  has_many :activity
  belongs_to :user
end
