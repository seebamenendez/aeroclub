class FlightType < ActiveRecord::Base

  enum status: [:Activo, :Deshabilitado]
  
  def self.custom_delete(flight_type)
    flight_type.status = 1
    return flight_type.save
  end


  def self.search(query)
    if query.nil?
      return FlightType.all
    else
      return FlightType.where('upper(name_flight) like ?', "%#{query.upcase}%")
    end
  end

end
