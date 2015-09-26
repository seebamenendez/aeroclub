class AddColumnKmStartAndKmFinishToTicketFlights < ActiveRecord::Migration
  def change
    add_column :ticket_flights, :km_start, :integer
    add_column :ticket_flights, :km_finish, :integer
  end
end
