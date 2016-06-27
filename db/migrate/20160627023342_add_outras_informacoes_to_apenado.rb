class AddOutrasInformacoesToApenado < ActiveRecord::Migration
  def change
    add_column :apenados, :outras_informacoes, :string
  end
end
