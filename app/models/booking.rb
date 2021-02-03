class Booking < ApplicationRecord
  include PgSearch::Model
  multisearchable against: %i[title location service_description first_name last_name description]

  belongs_to :user
  belongs_to :listing

  STATUS = ["Accepted", "Pending", "Cancelled"]

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
