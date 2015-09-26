class ChangeTimeFlyOnFlights < ActiveRecord::Migration
  def change
    change_column :flights, :time_fly, :integer
  end
end
