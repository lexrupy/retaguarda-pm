class Residencia < ActiveRecord::Base
  belongs_to :programa

  before_save :clear_retorno_if_needed

  def saida
    data_saida.strftime('%d/%m/%Y') unless data_saida.nil?
  end

  def retorno
    retorno_previsto.strftime('%d/%m/%Y') unless retorno_previsto.nil?
  end

  def retornou_em
    data_retorno.strftime('%d/%m/%Y') unless data_retorno.nil?
  end

  private

  def clear_retorno_if_needed
    unless self.ja_retornou
      self.data_retorno = nil
    end
  end


end
