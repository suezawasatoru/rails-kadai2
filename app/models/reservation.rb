class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :checkin, presence: true
  validates :checkout, presence: true
  validate :guest_value
  validate :check_over

  def check_over
    if checkin.present? && checkout.present? && checkin >= checkout 
      errors.add(:checkin, "より後の日付を入力して下さい")
    end
  end

  def guest_value
    if guest.blank? 
      errors.add(:guest, "を入力して下さい")
    elsif guest == 0
      errors.add(:guest, "を1人以上にして入力して下さい")
    end
  end  

  def total_day
   (checkout - checkin).to_i
  end

  def total_price
    total_day * room.price * guest
  end
end
