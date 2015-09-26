class ChangeStatusOnTicketMembers < ActiveRecord::Migration
  def change
    change_column :ticket_members, :status, :integer, default: 0
  end
end
