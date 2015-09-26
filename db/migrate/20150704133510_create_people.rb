class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :surname
      t.string :mail
      t.string :home
      t.integer :phone
      t.integer :age
      t.boolean :pilot
      t.boolean :guest
      t.string :id_number

      t.timestamps
    end
  end
end
