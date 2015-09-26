class ChangeStatusColumnOnPilotHabilitations < ActiveRecord::Migration
  def change
   change_column :pilot_habilitations, :status, :boolean, default: true
  end
end
