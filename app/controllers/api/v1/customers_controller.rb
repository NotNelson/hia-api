class Api::V1::CustomersController < ApplicationController
  def index
    @customers = Customer.all
    render json: @customers
  end

  def show
    @customer = Customer.find(params[:id])
    render json: @customer
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer
      @customer.save
      render json: @customer
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer
      @customer.update(customer_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    if @customer
      @customer.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:weight, :passport_no, :passport_expiry, :person_id)
  end
end
