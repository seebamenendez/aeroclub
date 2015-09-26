class PilotHabilitation < ActiveRecord::Base
  belongs_to :person


    def self.custom_delete(pilot)
    pilot.status = false
    return pilot.save
  end


end
