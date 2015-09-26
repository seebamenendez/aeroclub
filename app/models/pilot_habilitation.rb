class PilotHabilitation < ActiveRecord::Base
  belongs_to :person

  enum status: [:Activo, :Deshabilitado]

  def self.custom_delete(pilot)
    pilot.status = 1
    return pilot.save
  end


end
