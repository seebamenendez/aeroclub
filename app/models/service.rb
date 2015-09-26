class Service < ActiveRecord::Base
  belongs_to :plane
  
  def self.custom_delete(service)
    service.status = false
    return service.save
  end


  def self.search(query)
    if query.nil?
      return Service.all
    else
      return Service.joins(:plane).where('upper(services.name) like ? or upper(services.date) = ? or upper(planes.matricula) like ?', "%#{query.upcase}%", "#{query}", "%#{query.upcase}%")
    end
  end


  def complete_plane
    return "#{self.plane.name} #{self.plane.id_number}"
  end


end
