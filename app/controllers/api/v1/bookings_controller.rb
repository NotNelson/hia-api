class Api::V1::BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    render json: @bookings
  end

  def show
    @booking = Booking.find(params[:id])
    render json: @booking
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking
      @booking.save
      render json: @booking
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking
      @booking.update(booking_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking
      @booking.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, :customer_id, :date_created, :is_confirmed, :is_cancelled)
  end
end
