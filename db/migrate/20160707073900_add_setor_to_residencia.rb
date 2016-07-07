class AddSetorToResidencia < ActiveRecord::Migration
  def change
    add_reference :residencias, :setor, index: true, foreign_key: true
  end
end
