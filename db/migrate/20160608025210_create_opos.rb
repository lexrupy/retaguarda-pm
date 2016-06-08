class CreateOpos < ActiveRecord::Migration
  def change
    create_table :opos do |t|
      t.belongs_to :unidade, index: true, foreign_key: true
      t.string :numero
      t.string :descricao
      t.date :data_inicio
      t.date :data_fim
      t.text :texto

      t.timestamps null: false
    end
  end
end
