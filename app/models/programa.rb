class Programa < ActiveRecord::Base
  belongs_to :unidade
  has_many :residencias

  def unidade_nome
    unidade.nome if unidade
  end

  def inicio
    data_inicio.strftime('%d/%m/%Y')  unless data_inicio.nil?
  end

  def fim
    data_fim.strftime('%d/%m/%Y')  unless data_fim.nil?
  end


end
