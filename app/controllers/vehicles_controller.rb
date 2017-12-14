class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = current_user.vehicles

    render json: @vehicles
  end

  # GET /vehicles/1
  def show
    render json: @vehicle
  end

  def search
    raise(ExceptionHandler::MissingSearchError, 'Search Term Missing') unless params[:license_plate].present?
    @vehicles = current_user.vehicles.find_by(license_plate: params[:license_plate])
    render json: @vehicles
  end

  # POST /vehicles
  def create
    @vehicle = current_user.vehicles.create!(vehicle_params)

    if @vehicle.save
      render json: @vehicle, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      render json: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  def destroy
    @vehicle.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = current_user.vehicles.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vehicle_params
      params.require(:vehicle).permit(:merk, :handelsbenaming, :voertuigsoort, :eerste_kleur, :aantal_zitplaatsen, :catalogusprijs, :license_plate, :image_url)
    end
end
