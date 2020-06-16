class NeighborhoodSerializer

  def initialize(neighborhood_object)
    @neighborhood = neighborhood_object
  end

  def to_serialized_json    
    options = {
      include: { 
        businesses: {
          only: [:id, :name]
        }
      },
      except: [:created_at, :updated_at]
    }

    @neighborhood.to_json(options)
  end
end