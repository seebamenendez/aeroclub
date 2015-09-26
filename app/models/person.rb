class Person < ActiveRecord::Base
  has_many :flight_people, class_name: 'FlightPeople'
  has_many :flights, through: :flight_people, class_name: 'Flight'
  has_many :ticket_members
  has_one :pilot_habilitation
  
  def self.search(query)
    if query.nil?
      return Person.all
    else
      return Person.where('upper(name) like ? or upper(surname) like ? or upper(id_number) like ?', "%#{query.upcase}%", "%#{query.upcase}%", "%#{query.upcase}%")
    end
  end
  
  def complete_name
    return "#{self.name} #{self.surname}"
  end


  def complete_name_id_number
    return "#{self.id_number} - #{self.name} #{self.surname}"
  end


  def self.custom_delete(people)
    people.status = false
    return people.save
  end
  
  def debt
    self.ticket_members.where('ticket_members.status = ?', '0').sum('ticket_members.price')
  end

end
