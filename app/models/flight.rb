class Flight < ActiveRecord::Base
  belongs_to :plane
  belongs_to :person
  belongs_to :flight_type

  enum status: [ :Activo, :Deshabilitado, :Finalizado ]

  has_many :flight_people, class_name: 'FlightPeople'
  has_many :people, through: :flight_people, class_name: 'Person'


  def self.search(query)
    return Flight.joins(:plane).where('upper(planes.matricula) like ? or upper(flights.date) = ?', "%#{query.upcase}%", "#{query}")
  end


  def add_person(person)
    if self.flight_people.where(is_pilot: true).count == 0
      if person.pilot
        return self.flight_people.create(flight_id: self.id, person_id: person.id, is_pilot: true)
      else
        return self.flight_people.create(flight_id: self.id, person_id: person.id, is_pilot: false)
      end
    else
      return self.flight_people.create(flight_id: self.id, person_id: person.id, is_pilot: false)
    end
  end
  
  def remove_person(person)
    fp = self.flight_people.where(person_id: person.id).first
    return fp.destroy
  end
  
  def pilot 
    return self.flight_people.where(is_pilot: true).first.try(:person)
  end
  
  
  def self.custom_delete(flight)
    flight.status = 1
    return flight.save
  end


  def mont_flight
    self.flights.where('flights.time_fly = ?', '0')
  end


end
