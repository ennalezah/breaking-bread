class CitySerializer

  def initialize(city_object)
    @city = city_object
  end

  def to_serialized_json
    # @business.to_json(include: { 
    #   :neighborhood => { only: [:name], include: { 
    #     :city => { only: [:name] }} 
    #   } 
    # }, except: [:created_at, :updated_at, :neighborhood_id])
    
    options = {
      include: { 
        neighborhoods: { only: [:name] } 
      },
      except: [:created_at, :updated_at]
    }

    @city.to_json(options)
  end
end