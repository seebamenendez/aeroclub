class ChangeStatus < ActiveRecord::Migration
  def change
   change_column :services, :status, :integer, default: 0
   
   change_column :flight_types, :status, :integer, default: 0
   
   change_column :pilot_habilitations, :status, :integer, default: 0
   
   change_column :people, :status, :integer, default: 0
  end
end
