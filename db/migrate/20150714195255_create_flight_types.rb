class CreateFlightTypes < ActiveRecord::Migration
  def change
    create_table :flight_types do |t|
      t.string :name_flight
      t.string :description
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
