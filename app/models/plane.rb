class Plane < ActiveRecord::Base
  has_many :flights
  
  def self.custom_delete (plane)
    return true
  end


  def complete_plane
    return "#{self.name} - #{self.matricula}"
  end


  def self.search(query)
    if query.nil?
      return Plane.all
    else
      return Plane.where('upper(planes.name) like ? or upper(planes.model) like ? or upper(planes.matricula) like ?', "%#{query.upcase}%", "%#{query.upcase}%", "%#{query.upcase}%")
    end
  end

  def time
    self.flights.sum('flights.time_fly')
  end
end
