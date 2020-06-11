class Api::V1::CitiesController < ApplicationController
  def index
    cities = City.all
    render json: CitySerializer.new(cities).to_serialized_json, status: :accepted
  end
end
