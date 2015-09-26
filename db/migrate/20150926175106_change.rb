class Change < ActiveRecord::Migration
  def change
   change_column :planes, :status, :integer, default: 0
  end
end
