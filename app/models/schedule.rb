class Schedule < ApplicationRecord
  validates :title, presence: true, length: {maximum: 20}
  validates :start_date, :end_date, presence: true
  validates :memo, length: {maximum: 500}
  validate :end_date_must_be_after_start_date

  def end_date_must_be_after_start_date
    if start_date == nil || end_date == nil
      return
    elsif end_date < start_date
      errors.add(:end_date, "は開始日以降の日付で選択してください")
    end
  end
end
