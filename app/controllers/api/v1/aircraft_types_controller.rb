class Api::V1::AircraftTypesController < ApplicationController
  def index
    @aircraft_types = AircraftType.all
    render json: @aircraft_types
  end

  def show
    @aircraft_type = AircraftType.find(params[:id])
    render json: @aircraft_type
  end

  def create
    @aircraft_type = AircraftType.new(aircraft_type_params)
    if @aircraft_type
      @aircraft_type.save
      render json: @aircraft_type
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @aircraft_type = AircraftType.find(params[:id])
    if @aircraft_type
      @aircraft_type.update(aircraft_type_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @aircraft_type = AircraftType.find(params[:id])
    if @aircraft_type
      @aircraft_type.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def aircraft_type_params
    params.require(:aircraft_type).permit(:name)
  end
end
