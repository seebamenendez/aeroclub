class AddIsPilotToFlightPeople < ActiveRecord::Migration
  def change
    add_column :flight_people, :is_pilot, :boolean, default: false
  end
end
