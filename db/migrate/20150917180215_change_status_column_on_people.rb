class ChangeStatusColumnOnPeople < ActiveRecord::Migration
  def change
   change_column :people, :status, :boolean, default: true
  end
end
