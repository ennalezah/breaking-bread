class Api::V1::NeighborhoodsController < ApplicationController

  def index
    neighborhoods = Neighborhood.all
    render json: NeighborhoodSerializer.new(neighborhoods).to_serialized_json, status: :accepted
  end

  def show
    neighborhood = Neighborhood.find_by(id: params[:id])
    render json: neighborhood
  end

end