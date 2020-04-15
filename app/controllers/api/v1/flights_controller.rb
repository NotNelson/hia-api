class Api::V1::FlightsController < ApplicationController
  def index
    @flights = Flight.all
    render json: @flights
  end

  def show
    @flight = Flight.find(params[:id])
    render json: @flight
  end

  def create
    @flight = Flight.new(flight_params)
    if @flight
      @flight.save
      render json: @flight
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight
      @flight.update(flight_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    if @flight
      @flight.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def flight_params
    params.require(:flight).permit(:aircraft_id, :route_id)
  end
end
