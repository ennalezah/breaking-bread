class Api::V1::NeighborhoodsController < ApplicationController

  def index
    neighborhoods = Neighborhood.all
    render json: NeighborhoodSerializer.new(neighborhoods).to_serialized_json, status: :accepted
  end

  def show
    neighborhood = Neighborhood.find_by(id: params[:id])

    if neighborhood
      render json: NeighborhoodSerializer.new(neighborhood).to_serialized_json, status: :accepted
    else
      render json: {errors: "Neighborhood not found. Please check the ID and try again."}, status: :not_found
    end
  end

end