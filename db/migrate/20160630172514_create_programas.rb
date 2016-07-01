class CreateProgramas < ActiveRecord::Migration
  def change
    create_table :programas do |t|
      t.references :unidade, index: true, foreign_key: true

      t.string :descricao
      t.date :data_inicio
      t.date :data_fim

      t.timestamps null: false
    end
  end
end
