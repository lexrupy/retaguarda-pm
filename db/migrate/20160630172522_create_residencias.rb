class CreateResidencias < ActiveRecord::Migration
  def change

    create_table :residencias do |t|
      t.references :programa, index: true, foreign_key: true
      t.string :telefones
      t.string :nome
      t.string :endereco
      t.date :data_saida
      t.date :retorno_previsto
      t.boolean :ja_retornou
      t.date :data_retorno
      t.text :informacoes_complementares
      

      t.timestamps null: false
    end
  end
end
