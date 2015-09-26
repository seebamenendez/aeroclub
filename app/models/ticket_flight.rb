class TicketFlight < ActiveRecord::Base

  belongs_to :person
  belongs_to :flight
  belongs_to :plane
  belongs_to :flight_type


  enum status: [ :Activo, :Deshabilitado, :Pago ]


  def self.search(query)
    if query.nil?
      return TicketFlight.all
    else
      return TicketFlight.joins(:plane, :flight, :flight_type).where('upper(flights.date) = ? or upper(planes.matricula) like ? or upper(flight_types.name_flight) like ?', "#{query}", "%#{query.upcase}%", "%#{query.upcase}%")
    end
  end


  def self.create_new(flight)
    if ["Comercial", "Comercial - Corto", "Comercial - Medio", "Comercial - Largo"].include?(flight.flight_type.name_flight)
      bill = TicketFlight.new
      bill.person = flight.pilot
      bill.flight = flight
      bill.plane = flight.plane
      bill.flight_type = flight.flight_type
      bill.price = bill.flight_type.price
      bill.km_start = flight.km_start
      bill.km_end = flight.km_end
      bill.time_fly = flight.time_fly
      bill.save
    else
      flight.people.each do |person|
        unless person.id == flight.pilot.id
          bill = TicketFlight.new
          bill.person = person
          bill.flight = flight
          bill.plane = flight.plane
          bill.flight_type = flight.flight_type
          bill.price = bill.flight_type.price
          bill.km_start = flight.km_start
          bill.km_end = flight.km_end
          bill.time_fly = flight.time_fly
          if !bill.save
            return false
          end
        end
      end
      return true
    end
  end
end
