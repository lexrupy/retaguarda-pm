class Opo < ActiveRecord::Base
  belongs_to :unidade

  def unidade_nome
    unidade.nome if unidade
  end

end
