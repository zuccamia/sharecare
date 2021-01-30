class ListingsController < ApplicationController
  def index
    # @listings = Listing.all
    @listings = policy_scope(Listing)
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
  end
end
