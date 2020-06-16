class NeighborhoodSerializer

  def initialize(neighborhood_object)
    @neighborhood = neighborhood_object
  end

  def to_serialized_json    
    options = {
      include: { 
        city: { only: [:id, :name] },
        businesses: {
          only: [:id, :name]
        }
      },
      except: [:city_id, :created_at, :updated_at]
    }

    @neighborhood.to_json(options)
  end
end