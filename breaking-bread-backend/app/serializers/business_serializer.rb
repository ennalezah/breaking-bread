class BusinessSerializer

  def initialize(business_object)
    @business = business_object
  end

  def to_serialized_json
    # @business.to_json(include: { 
    #   :neighborhood => { only: [:name], include: { 
    #     :city => { only: [:name] }} 
    #   } 
    # }, except: [:created_at, :updated_at, :neighborhood_id])
    
    options = {
      include: { 
        neighborhood: {
          only: [:id, :name],
          include: {:city => { only: [:name] }} 
        } 
      },
      except: [:neighborhood_id, :created_at, :updated_at]
    }

    @business.to_json(options)
  end
end