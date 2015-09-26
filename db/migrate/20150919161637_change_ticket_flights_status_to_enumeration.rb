class ChangeTicketFlightsStatusToEnumeration < ActiveRecord::Migration
  def change
    change_column :ticket_flights, :status, :integer, default: 0
  end
end
