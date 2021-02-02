class ListingsController < ApplicationController
  before_action :call_listing, only: [:show, :create]

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

  def show
    @markers = [{
        lat: @listing.latitude,
        lng: @listing.longitude
      }]
  end

  private

  def call_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:fee, :service_description, :location, :title, tag_list: [])
  end
end
