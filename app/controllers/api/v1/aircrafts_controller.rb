class Api::V1::AircraftsController < ApplicationController
  def index
    @aircrafts = Aircraft.all
    render json: @aircrafts
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    render json: @aircraft
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    if @aircraft
      @aircraft.save
      render json: @aircraft
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @aircraft = Aircraft.find(params[:id])
    if @aircraft
      @aircraft.update(aircraft_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @aircraft = Aircraft.find(params[:id])
    if @aircraft
      @aircraft.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def aircraft_params
    params.require(:aircraft).permit(:name, :year, :aircraft_type_id)
  end
end
