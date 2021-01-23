class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validations :start_date, presence: true
  validations :end_date, presence: true
  validations :status, presence: true
end
