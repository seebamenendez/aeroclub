class CreateRols < ActiveRecord::Migration
  def change
    create_table :rols do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
