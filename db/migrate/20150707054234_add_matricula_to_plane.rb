class AddMatriculaToPlane < ActiveRecord::Migration
  def change
    add_column :planes, :matricula, :string
  end
end
