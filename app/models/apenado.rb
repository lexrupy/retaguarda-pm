class Apenado < ActiveRecord::Base
  belongs_to :unidade
  has_many :photos, dependent: :destroy
  has_many :visits, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true


  def unidade_nome
    unidade.nome if unidade
  end

  def proximas_visitas
    self.visits.where("data_visita >= ?", Date.yesterday);
  end

end
