class CreateTicketFlights < ActiveRecord::Migration
  def change
    create_table :ticket_flights do |t|
      t.integer :flight_id
      t.integer :person_id
      t.integer :plane_id
      t.integer :flight_type_id
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
