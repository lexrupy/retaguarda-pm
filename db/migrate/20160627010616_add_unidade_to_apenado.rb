class AddUnidadeToApenado < ActiveRecord::Migration
  def change
    add_reference :apenados, :unidade, index: true, foreign_key: true
  end
end
