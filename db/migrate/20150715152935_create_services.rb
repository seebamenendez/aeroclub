class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :description
      t.date :date
      t.integer :plane_id
      t.integer :status

      t.timestamps
    end
  end
end
