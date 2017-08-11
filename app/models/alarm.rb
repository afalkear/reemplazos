class Alarm < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  belongs_to :activity

  validates :offset, :offset_type, :user_id, :responsible_id, :activity_id, presence: true
  validates :offset, numericality: true

  VALID_OFFSETS = ["minutes", "hours", "days"]

  def self.bulk_add(user_id, offset, offset_type)
    if !VALID_OFFSETS.include?(offset_type)
      return {success: false, errors: "Offset type is not a valid option"}
    # is not a number
    elsif !(offset =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
      return {success: false, errors: "Offset must be a number"}
    else
      acts = Activity.where(user_id: user_id)
      acts.each do |a|
        Alarm.create(user_id: user_id, activity_id: a.id, responsible_id: a.responsible.id, offset: offset, offset_type: offset_type)
      end
    end
    return {success: true, errors: ""}
  end
end
