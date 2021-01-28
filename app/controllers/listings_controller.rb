class ListingsController < ApplicationController
  before_action :call_listing, only: [:show, :create]

  def show
  end

  private

  def call_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:fee, :service_description, :location, :title)
  end
end
