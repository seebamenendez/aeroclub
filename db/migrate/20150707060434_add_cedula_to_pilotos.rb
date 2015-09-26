class AddCedulaToPilotos < ActiveRecord::Migration
  def change
    add_column :pilotos, :cedula, :integer
  end
end
