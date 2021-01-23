class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :fee, presence: true
  validates :service_description, presence: true
  validates :availability, presence: true
  validates :tags, presence: true, array: true
end
