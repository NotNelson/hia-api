class Api::V1::EmployeesController < ApplicationController
  def index
    @employees = Employee.all
    render json: @employees
  end

  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee
      @employee.save
      render json: @employee
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee
      @employee.update(employee_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee
      @employee.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:date_start, :section, :is_active)
  end
end
