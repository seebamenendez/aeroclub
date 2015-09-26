class ChangeStatusColumnOnFlightTypes < ActiveRecord::Migration
  def change
   change_column :flight_types, :status, :boolean, default: true
  end
end
