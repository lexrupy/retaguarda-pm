class AddAtivoToUser < ActiveRecord::Migration
  def change
    add_column :users, :ativo, :boolean, default: true
  end
end
