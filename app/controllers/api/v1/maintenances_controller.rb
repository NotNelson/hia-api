class Api::V1::MaintenancesController < ApplicationController
  def index
    employee_id = params[:employee_id]
    @maintenance = Maintenance.where(employee_id: employee_id)
    render json: @maintenance
  end

  def show
    @maintenance = Maintenance.find(params[:id])
    render json: @maintenance
  end

  def create
    @maintenance = Maintenance.new(maintenance_params)
    if @maintenance
      @maintenance.save
      render json: @maintenance
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @maintenance = Maintenance.find(params[:id])
    if @maintenance
      @maintenance.update(maintenance_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @maintenance = Maintenance.find(params[:id])
    if @maintenance
      @maintenance.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def maintenance_params
    params.require(:maintenance).permit(:employee_id, :aircraft_id, :date_scheduled, :comments)
  end
end
