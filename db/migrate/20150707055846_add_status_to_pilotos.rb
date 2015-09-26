class AddStatusToPilotos < ActiveRecord::Migration
  def change
    add_column :pilotos, :status, :integer
  end
end
