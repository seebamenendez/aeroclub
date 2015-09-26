class DropPeople < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exist 'people'
  	  drop_table :people
  	end
  end
end
