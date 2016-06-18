class Opo < ActiveRecord::Base
  belongs_to :unidade

  def inicio
    "#{data_inicio.day}/#{data_inicio.month}/#{data_inicio.year}"
  end

  def fim
    "#{data_fim.day}/#{data_fim.month}/#{data_fim.year}"
  end

end
