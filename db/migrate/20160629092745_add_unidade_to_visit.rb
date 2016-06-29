class AddUnidadeToVisit < ActiveRecord::Migration
  def change
    add_reference :visits, :unidade, index: true, foreign_key: true
  end
end
