class CreatePilotHabilitations < ActiveRecord::Migration
  def change
    create_table :pilot_habilitations do |t|
      t.integer :person_id
      t.date :date_expiration
      t.date :date_start
      t.integer :status

      t.timestamps
    end
  end
end
