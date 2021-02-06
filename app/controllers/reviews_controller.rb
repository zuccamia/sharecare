class ReviewsController < ApplicationController
  # def new
  #  @listing = Listing.find(params[:listing_id])
  #  @review = Review.new
  # end

  def create
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @review.listing = @listing
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to listing_path(@listing), notice: 'Review was successfully created!'
    else
      render 'listing_path'
    end
  end

  def show
    @review = Review.find(params[:listing_id])
  end

  private

  def review_params
    params.require(:review).permit(:nickname, :comment)
  end
end
