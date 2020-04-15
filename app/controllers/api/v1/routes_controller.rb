class Api::V1::RoutesController < ApplicationController
  def index
    @routes = Route.all
    render json: @routes
  end

  def show
    @route = Route.find(params[:id])
    render json: @route
  end

  def create
    @route = Route.new(route_params)
    if @route
      @route.save
      render json: @route
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @route = Route.find(params[:id])
    if @route
      @route.update(route_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @route = Route.find(params[:id])
    if @route
      @route.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def route_params
    params.require(:route).permit(:origin, :destination)
  end
end
