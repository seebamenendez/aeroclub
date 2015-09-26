class CreatePlane < ActiveRecord::Migration
  def change
    create_table :plane do |t|
      t.string :name
      t.string :model
      t.integer :year
      t.text :description

      t.timestamps
    end
  end
end
