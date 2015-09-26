class AddStatusToPlane < ActiveRecord::Migration
  def change
    add_column :planes, :status, :integer
  end
end
