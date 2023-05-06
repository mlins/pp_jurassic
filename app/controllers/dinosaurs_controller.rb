class DinosaursController < ApplicationController
  before_action :set_dinosaur, only: %i[ show update destroy ]

  def index
    @dinosaurs = Dinosaur.all

    render json: @dinosaurs
  end

  def show
    render json: @dinosaur
  end

  def create
    @dinosaur = Dinosaur.new(dinosaur_params)

    if @dinosaur.save
      render json: @dinosaur, status: :created, location: @dinosaur
    else
      render json: @dinosaur.errors, status: :unprocessable_entity
    end
  end

  def update
    if @dinosaur.update(dinosaur_params)
      render json: @dinosaur
    else
      render json: @dinosaur.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @dinosaur.destroy
  end

  private

  def set_dinosaur
    @dinosaur = Dinosaur.find(params[:id])
  end

  def dinosaur_params
    params.fetch(:dinosaur, {}).permit(:name, :species, :cage_id)
  end
end
