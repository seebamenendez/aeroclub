class ChangeStatusColumnOnTicketMembers < ActiveRecord::Migration
  def change
   change_column :ticket_members, :status, :boolean, default: true
  end
end
