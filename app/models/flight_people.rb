class FlightPeople < ActiveRecord::Base

  belongs_to :person
  belongs_to :flight

end
