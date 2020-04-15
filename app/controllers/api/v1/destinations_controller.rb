class Api::V1::DestinationsController < ApplicationController
  def index
    @destinations = Destination.all
    render json: @destinations
  end

  def show
    @destination = Destination.find(params[:id])
    render json: @destination
  end

  def create
    @destination = Destination.new(destination_params)
    if @destination
      @destination.save
      render json: @destination
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @destination = Destination.find(params[:id])
    if @destination
      @destination.update(destination_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @destination = Destination.find(params[:id])
    if @destination
      @destination.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def destination_params
    params.require(:destination).permit(:name)
  end
end
