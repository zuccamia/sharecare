class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :fee, presence: true
  validates :service_description, presence: true, length: { maximum: 500 }

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
