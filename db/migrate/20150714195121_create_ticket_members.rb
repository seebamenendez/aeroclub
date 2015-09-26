class CreateTicketMembers < ActiveRecord::Migration
  def change
    create_table :ticket_members do |t|
      t.integer :person_id
      t.integer :price
      t.integer :status

      t.timestamps
    end
  end
end
