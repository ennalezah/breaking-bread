class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = Business.all
    render json: BusinessSerializer.new(businesses).to_serialized_json, status: :accepted
  end

  def show
    business = Business.find_by(id:params[:id])

    if business
      render json: BusinessSerializer.new(business).to_serialized_json, status: :accepted
    else
      render json: {errors: "Business not found. Please check the ID and try again."}, status: :not_found
    end
  end

  def create
    business = Business.new(business_params)

    if business.save
      render json: BusinessSerializer.new(business).to_serialized_json, status: :accepted
    else
      render json: {errors: business.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :phone, :website, :instagram, :neighborhood_id)
  end
end
