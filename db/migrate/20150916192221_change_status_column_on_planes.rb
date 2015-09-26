class ChangeStatusColumnOnPlanes < ActiveRecord::Migration
  def change
   change_column :planes, :status, :boolean, default: true
  end
end
