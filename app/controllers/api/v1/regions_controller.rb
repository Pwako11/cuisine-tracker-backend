class Api::V1::RegionsController < ApplicationController
  before_action :set_region, only: [:show, :update, :destroy]

  # GET /regions
  def index

    @regions = Region.all

    serializedRegions = RegionSerializer.new(@regions).serializable_hash.to_json

    render json: serializedRegions
  end

  # GET /regions/1
  def show
    serializedRegion = RegionSerializer.new(@region).serializable_hash.to_json
    render json: serializedRegion
  end

  # POST /regions
  def create
    @region = Region.new(region_params)

    if @region.save
      serializedRegion = RegionSerializer.new(@region).serializable_hash.to_json
      render json: serializedRegion, status: :created
    else
      error_resp = {
        error: @region.errors.full_message.to_sentence
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /regions/1
  def update
    if @region.update(region_params)
      serializedRegion = RegionSerializer.new(@region).serializable_hash.to_json
      render json: serializedRegion
    else
      error_resp = {
        error: @region.errors.full_message.to_sentence
        
      }
      render json: error_resp, status: :unprocessable_entity
    end
  end

  # DELETE /regions/1
  def destroy
    @region.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_region
      @region = Region.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def region_params
      params.require(:region).permit(:continent, :country, :state)
    end
end
