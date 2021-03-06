class Listing < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[title service_description location fee],
    associated_against: {
      user: %i[first_name last_name description]
    },
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates :fee, presence: true
  validates :service_description, presence: true, length: { maximum: 500 }
  acts_as_taggable_on :tags

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo
end
