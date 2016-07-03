class Programa < ActiveRecord::Base
  belongs_to :unidade
  has_many :residencias

  def unidade_nome
    unidade.nome if unidade
  end

end
