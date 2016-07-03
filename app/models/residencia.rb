class Residencia < ActiveRecord::Base
  belongs_to :programa

  before_save :clear_retorno_if_needed

  private

  def clear_retorno_if_needed
    unless self.ja_retornou
      self.data_retorno = nil
    end
  end


end
