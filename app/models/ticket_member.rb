class TicketMember < ActiveRecord::Base
  belongs_to :person

  enum status: [ :Activo, :Deshabilitado, :Pago ]

  def self.search(query)
    return TicketMember.joins(:person).where('upper(people.id_number) like ? or upper(people.name) like ? or upper(people.surname) like ? or upper(ticket_members.date) = ?', "%#{query.upcase}%", "%#{query.upcase}%", "%#{query.upcase}%", "#{query}")
  end



end
