class RenameColumnKmFinishToKmEndInTicketFlights < ActiveRecord::Migration
  def change
    rename_column :ticket_flights, :km_finish, :km_end
  end
end
