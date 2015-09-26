class AddDateToTicketMembers < ActiveRecord::Migration
  def change
    add_column :ticket_members, :date, :date
  end
end
