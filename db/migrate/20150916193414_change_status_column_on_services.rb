class ChangeStatusColumnOnServices < ActiveRecord::Migration
  def change
   change_column :services, :status, :boolean, default: true
  end
end
