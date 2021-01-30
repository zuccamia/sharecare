class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :fee, presence: true
<<<<<<< HEAD
  validates :service_description, presence: true

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
=======
  validates :service_description, presence: true, length: { maximum: 500 }
>>>>>>> 102cebba347ecdbf5189e76219a83c636bd2dda6
end
