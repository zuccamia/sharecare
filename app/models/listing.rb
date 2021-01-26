class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :fee, presence: true
  validates :service_description, presence: true
end
