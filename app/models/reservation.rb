class Reservation < ApplicationRecord
  belongs_to :room
  
  validates :customer_name, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  
  validate :end_time_after_start_time
  validate :no_overlapping_reservations
  
  def end_time_after_start_time
    return if start_time.blank? || end_time.blank?
    
    if end_time <= start_time
      errors.add(:end_time, "must be after the start time")
    end
  end
  
  def no_overlapping_reservations
    return if room_id.blank? || start_time.blank? || end_time.blank?
    
    overlapping = Reservation.where(room_id: room_id)
    .where.not(id: id)
    .where.not(status: "declined")
    .where("start_time < ? AND end_time > ?", end_time, start_time)
    
    if overlapping.exists?
      errors.add(:base, "This room is already reserved during the selected time period.")
    end
  end
  
end
