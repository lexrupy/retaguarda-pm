class Residencia < ActiveRecord::Base
  belongs_to :programa
  belongs_to :setor

  before_save :clear_retorno_if_needed

  def setor_nome
    setor.nome if setor
  end

  private

  def clear_retorno_if_needed
    unless self.ja_retornou
      self.data_retorno = nil
    end
  end


end
