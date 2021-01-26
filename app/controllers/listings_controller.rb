class ListingsController < ApplicationController
  before_action :call_listing, only: [:show, :create]
  def index
    @listings = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing, notice: 'Listing was successfully created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_to @listing, notice: 'Changes were successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @listing.destroy
    redirect_to @listing, notice: 'Listing was deleted.'
  end

  private
  def call_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:fee, :service_description, :location, :title)
  end
end
