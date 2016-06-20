class AddFieldsToOpo < ActiveRecord::Migration
  def change
    add_column :opos, :hora, :string
    add_column :opos, :local, :string
    add_column :opos, :evento, :string
    add_column :opos, :solicitante, :string
  end
end
