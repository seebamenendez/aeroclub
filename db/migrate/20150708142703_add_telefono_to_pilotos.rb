class AddTelefonoToPilotos < ActiveRecord::Migration
  def change
    add_column :pilotos, :telefono, :string
  end
end
