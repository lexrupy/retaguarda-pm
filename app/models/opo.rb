class Opo < ActiveRecord::Base
  belongs_to :unidade

  def inicio
    data_inicio.strftime('%d/%m/%Y')
  end

  def fim
    data_fim.strftime('%d/%m/%Y')
  end

  def unidade_nome
    unidade.nome if unidade
  end

end
