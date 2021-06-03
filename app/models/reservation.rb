class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def date_check
    end_date - start_date
  end

  def use_date
    date = date_check.to_i
    use_date = '使用日数：' + date.to_s + '日'
  end

  def total_amount
    room_price * person_num * date_check.to_i
  end
  
  validate :today_check?
  validate :start_end_check?
  validate :person_check?

  def today_check?
    errors.add(:start_date, "は本日以降を選択してください") if start_date.nil? || start_date < Date.today
  end

  def start_end_check?
    errors.add(:end_date, "は開始日以降を選択してください") if end_date.nil? || start_date >= end_date
  end

  def person_check?
    errors.add(:person_num, "は１人から選択してください") if person_num.nil? || person_num < 1
  end

end
