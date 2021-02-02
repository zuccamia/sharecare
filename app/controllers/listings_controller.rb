class ListingsController < ApplicationController
  before_action :call_listing, only: [:show]

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

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    authorize @listing
    if @listing.save
      redirect_to listing_path(@listing), notice: 'Listing was successfully created!'
    else
      render :new
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
    params.require(:listing).permit(:fee, :service_description, :location, :title, :photo, tag_list: [])
  end
end
