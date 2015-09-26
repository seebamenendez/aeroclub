class CreateRolFunctions < ActiveRecord::Migration
  def change
    create_table :rol_functions do |t|
      t.integer :rol_id
      t.integer :function_id

      t.timestamps
    end
  end
end
