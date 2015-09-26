class ChangeStatusColumnOnFlights < ActiveRecord::Migration
  def change
   change_column :flights, :status, :boolean, default: true
  end
end
