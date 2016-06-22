class CreateApenados < ActiveRecord::Migration
  def change
    create_table :apenados do |t|
      t.string :nome
      t.date :termino
      t.text :restricoes
      t.string :sexo
      t.date :nascimento
      t.string :mae
      t.string :documentos
      t.string :naturalidade
      t.string :condenado_por
      t.string :endereco
      t.boolean :ativo
      t.string :motivo_inativo

      t.timestamps null: false
    end
  end
end
