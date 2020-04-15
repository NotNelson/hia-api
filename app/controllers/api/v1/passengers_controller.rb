class Api::V1::PassengersController < ApplicationController
  def index
    @passengers = Passenger.all
    render json: @passengers
  end

  def show
    @passenger = Passenger.find(params[:id])
    render json: @passenger
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger
      @passenger.save
      render json: @passenger
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @passenger = Passenger.find(params[:id])
    if @passenger
      @passenger.update(passenger_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @passenger = Passenger.find(params[:id])
    if @passenger
      @passenger.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def passenger_params
    params.require(:passenger).permit(:customer_id, :booking_id)
  end
end
