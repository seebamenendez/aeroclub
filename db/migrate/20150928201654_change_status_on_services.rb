class ChangeStatusOnServices < ActiveRecord::Migration
  def change
       change_column :services, :status, :integer, default: 0
  end
end
