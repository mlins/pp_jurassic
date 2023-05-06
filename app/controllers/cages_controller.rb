class CagesController < ApplicationController
  before_action :set_cage, only: %i[show update destroy]

  def index
    @cages = Cage.all

    render json: @cages
  end

  def show
    render json: @cage
  end

  def create
    @cage = Cage.new(cage_params)

    if @cage.save
      render json: @cage, status: :created, location: @cage
    else
      render json: @cage.errors, status: :unprocessable_entity
    end
  end

  def update
    if @cage.update(cage_params)
      render json: @cage
    else
      render json: @cage.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @cage.destroy
  end

  private

  def set_cage
    @cage = Cage.find(params[:id])
  end

  def cage_params
    params.fetch(:cage, {}).permit(:power_status)
  end
end
