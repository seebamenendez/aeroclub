class ChangeFlightStatusToEnumeration < ActiveRecord::Migration
  def change
    change_column :flights, :status, :integer, default: 0
  end
end
