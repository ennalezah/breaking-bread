class Api::V1::CitiesController < ApplicationController
  def index
    cities = City.all
    render json: CitySerializer.new(cities).to_serialized_json, status: :accepted
  end

  def show
    city = City.find_by(id: params[:id])

    if city
      render json: CitySerializer.new(city).to_serialized_json, status: :accepted
    else
      render json: "City not found. Please check the ID and try again.", status: :not_found
    end
  end
end
