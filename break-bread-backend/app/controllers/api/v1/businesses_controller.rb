class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = Business.all
    render json: businesses
  end

  def create
    business = Business.new(business_params)

    if business.save
      render json: business, status: :accepted 
    else
      render json: {errors: business.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def business_params
    params.permit(:business).require(:name, :phone, :website, :instagram, :neighborhood_id)
  end
end
