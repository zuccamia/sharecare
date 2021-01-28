class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def profile
    @listing = Listing.find(params[:id])
    @user = @listing.user
  end
end
