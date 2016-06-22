class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.references :apenado, index: true, foreign_key: true
      t.date :data_visita
      t.boolean :realizada
      t.boolean :alteracao
      t.string :ocorrencia

      t.timestamps null: false
    end
  end
end
