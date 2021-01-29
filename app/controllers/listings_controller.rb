class ListingsController < ApplicationController
  def index
    # @listings = Listing.all
    @listings = policy_scope(Listing)
  end
end
