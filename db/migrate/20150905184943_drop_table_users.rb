class DropTableUsers < ActiveRecord::Migration
  def change
    if User.table_exists?
      drop_table :users
    end
  end
end
