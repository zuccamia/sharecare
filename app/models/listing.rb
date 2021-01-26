class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :location, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :fee, presence: true
  validates :service_description, presence: true, length: { maximum: 500 }
end
