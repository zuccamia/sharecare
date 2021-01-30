class ListingsController < ApplicationController
<<<<<<< HEAD
  before_action :call_listing, only: [:show, :create]

  def show
  end

  private

  def call_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:fee, :service_description, :location, :title)
=======
  def index
    # @listings = Listing.all
    @listings = policy_scope(Listing)
    @markers = @listings.geocoded.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude
      }
    end
>>>>>>> 102cebba347ecdbf5189e76219a83c636bd2dda6
  end
end
