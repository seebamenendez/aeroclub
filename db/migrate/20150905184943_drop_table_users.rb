class DropTableUsers < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exist 'users'
      drop_table :users
    end
  end
end
