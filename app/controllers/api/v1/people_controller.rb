class Api::V1::PeopleController < ApplicationController
  def index
    a = params[:search]
    puts a
    @people = Person.all
    render json: @people
  end

  def show
    @person = Person.find(params[:id])
    render json: @person
  end

  def create
    @person = Person.new(person_params)
    if @person
      @person.save
      render json: @person
    else
      render error: { error: 'Unable to create record.'}, status: 400
    end
  end

  def update
    @person = Person.find(params[:id])
    if @person
      @person.update(person_params)
      render json: { message: 'Record successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to update record.' }, status: 400
    end
  end

  def destroy
    @person = Person.find(params[:id])
    if @person
      @person.destroy
      render json: { message: 'Record successfully deleted.' }, status: 200
    else
      render json: { error: 'Unable to delete record.' }, status: 400
    end
  end

  def person_exists
    birth_date = params[:birth_date]
    last_name = params[:last_name]
    matches = Person.where(birth_date: birth_date, last_name: last_name)

    if matches.count > 0
      render json: { message: 'Person already on the database' }, status: 200
    else
      render json: { message: 'Person is not on the database' }, status: 200
    end
  end

  private
  def person_params
    params.require(:person).permit(:last_name, :names, :birth_date)
  end
end
