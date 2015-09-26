class DropPeople < ActiveRecord::Migration
  def change
    if Person.table_exists?
  	  drop_table :people
  	end
  end
end
