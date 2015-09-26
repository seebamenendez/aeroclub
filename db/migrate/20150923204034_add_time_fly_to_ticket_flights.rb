class AddTimeFlyToTicketFlights < ActiveRecord::Migration
  def change
    add_column :ticket_flights, :time_fly, :integer
  end
end
