class Api::V1::BusinessesController < ApplicationController
  def index
    businesses = Business.all
    render json: businesses, include: { 
      :neighborhood => { only: [:name], include: { 
        :city => { only: [:name] }} 
      } 
    }, except: [:created_at, :updated_at, :neighborhood_id], status: :accepted
  end

  def show
    business = Business.find_by(id: params[:id])

    if business
      render json: business, include: { 
        :neighborhood => { only: [:name], include: { 
          :city => { only: [:name] }} 
        } 
      }, except: [:created_at, :updated_at, :neighborhood_id], status: :accepted
    else
      render json: {errors: business.errors.full_messages}, status: :not_found
    end
  end

  def create
    business = Business.new(business_params)

    if business.save
      render json: business, include: { 
        :neighborhood => { only: [:name], include: { 
          :city => { only: [:name] }} 
        } 
      }, except: [:created_at, :updated_at, :neighborhood_id], status: :accepted
    else
      render json: {errors: business.errors.full_messages}, status: :unprocessible_entity
    end
  end

  private

  def business_params
    params.permit(:business).require(:name, :phone, :website, :instagram, :neighborhood_id)
  end
end
