class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :fee, presence: true
  validates :service_description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
