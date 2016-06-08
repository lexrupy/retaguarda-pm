class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :matricula
      t.string :nome
      t.boolean :admin
      t.belongs_to :unidade
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
