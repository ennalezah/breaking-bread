class CitySerializer

  def initialize(city_object)
    @city = city_object
  end

  def to_serialized_json    
    options = {
      include: { 
        neighborhoods: { only: [:id, :name] } 
      },
      except: [:created_at, :updated_at]
    }

    @city.to_json(options)
  end
end