class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing

  STATUS = ["🟢", "Pending", "❌"]

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_is_after_start_date
  validates :status, presence: true, inclusion: { in: STATUS }

  private

  def end_date_is_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "cannot be before the start date")
    end
  end
end
