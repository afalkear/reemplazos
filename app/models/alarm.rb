class Alarm < ApplicationRecord
  belongs_to :user
  belongs_to :responsible
  belongs_to :activity

  validates :offset, :offset_type, :user_id, :responsible_id, :activity_id, presence: true
  validates :offset, numericality: true

  VALID_OFFSETS = ["minutes", "hours", "days"]

  def self.bulk_add(user_id, offset, offset_type)
    resp = check_if_valid_options(offset, offset_type)
    resp[:count] = 0
    if resp[:success]
      acts = Activity.where(user_id: user_id)
      acts.each do |a|
        Alarm.create(user_id: user_id, activity_id: a.id, responsible_id: a.responsible.id, offset: offset, offset_type: offset_type)
        resp[:count] = acts.count
      end
    end
    resp
  end

  def self.bulk_remove(user_id, offset, offset_type)
    resp = check_if_valid_options(offset, offset_type)
    resp[:count] = 0
    if resp[:success]
      resp[:count] = Alarm.where(user_id: user_id, offset: offset, offset_type: offset_type).count
      Alarm.where(user_id: user_id, offset: offset, offset_type: offset_type).map(&:destroy)
    end

    resp
  end

  private

  def self.check_if_valid_options(offset, offset_type)
    if !VALID_OFFSETS.include?(offset_type)
      return {success: false, errors: "Offset type is not a valid option"}
    # is not a number
    elsif !(offset =~ /\A[-+]?[0-9]*\.?[0-9]+\Z/)
      return {success: false, errors: "Offset must be a number"}
    end
    return {success: true, errors: ""}
  end
end
