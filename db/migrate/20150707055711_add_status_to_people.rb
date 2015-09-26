class AddStatusToPeople < ActiveRecord::Migration
  def change
    add_column :people, :status, :integer
  end
end
