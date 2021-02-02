class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @listings = Listing.all
  end

  def caregiver_profile
    @listing = Listing.find(params[:id])
    @user = @listing.user
  end

  def by_user
    @user = User.find(params[:id])
    @listings = @user.listings
  end

  def profile
    @my_bookings = current_user.bookings
    @my_listings = current_user.listings
  end
end
