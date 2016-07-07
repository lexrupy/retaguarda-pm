class CreateSetores < ActiveRecord::Migration
  def change
    create_table :setores do |t|
      t.references :unidade, index: true, foreign_key: true
      t.string :nome

      t.timestamps null: false
    end
  end
end
