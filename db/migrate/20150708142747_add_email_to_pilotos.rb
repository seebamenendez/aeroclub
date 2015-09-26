class AddEmailToPilotos < ActiveRecord::Migration
  def change
    add_column :pilotos, :email, :string
  end
end
