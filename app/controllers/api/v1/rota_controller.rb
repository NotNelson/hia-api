class Api::V1::RotaController < ApplicationController
  def index
    @rotas = Rotum.all
    render json: @rotas
  end

  def show
    @rota = Rotum.find(params[:id])
    render json: @rota
  end

  def create
    @rota = Rotum.new(rota_params)
    if @rota
      @rota.save
      render json: @rota
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @rota = Rotum.find(params[:id])
    if @rota
      @rota.update(rota_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @rota = Rotum.find(params[:id])
    if @rota
      @rota.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  private
  def rota_params
    params.require(:rota).permit(:employee_id, :shift_date, :time_start, :time_end)
  end
end
