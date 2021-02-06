class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @listing = Listing.find(params[:listing_id])
    @booking.listing = @listing
    @booking.user = current_user
    @booking.status = "Pending"
    authorize @booking
    if @booking.save
      redirect_to listing_path(@listing), notice: 'Booking was successfully created!'
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update_status
    @booking = Booking.find(params[:booking_id])
    @booking.update(status: params[:status])
    authorize @booking
    redirect_to profile_path
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to listing_booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to listing_bookings_path, notice: 'Booking was successfully deleted.'
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :notes)
  end
end
