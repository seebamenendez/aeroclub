class CreateFlightPeople < ActiveRecord::Migration
  def change
    create_table :flight_people do |t|
      t.integer :flight_id
      t.integer :person_id

      t.timestamps
    end
  end
end
