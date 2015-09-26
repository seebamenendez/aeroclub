class CreateUserRols < ActiveRecord::Migration
  def change
    create_table :user_rols do |t|
      t.integer :user_id
      t.integer :rol_id

      t.timestamps
    end
  end
end
