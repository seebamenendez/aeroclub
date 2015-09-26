class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :plane_id
      t.integer :person_id
      t.date :date
      t.integer :flight_type_id
      t.integer :time_fly
      t.string :km_start
      t.string :km_end
      t.integer :fuel_charged
      t.integer :status

      t.timestamps
    end
  end
end
