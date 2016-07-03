class Visit < ActiveRecord::Base
  belongs_to :apenado
  belongs_to :unidade
  
  def apenado_nome
    apenado.nome if apenado
  end

  def self.gerar_visitas(data_final, unidade_id)
    unidade = Unidade.find(unidade_id)
    unidade.visits.where('data_visita >= ?', Date.today).destroy_all
    dias = (data_final.to_date - Date.today.to_date).to_i
    logger.debug("QUANTIDADE DIAS = #{dias}")
    apenado_ids = unidade.apenados.where(ativo:true).ids.shuffle
    count = apenado_ids.size
    pos = 0
    i = 0
    begin
      data = (i-1).day.from_now
      apenado_1_id = apenado_ids[pos]
      pos += 1
      if pos > (count-1).to_i
        pos = 0
      end

      apenado_2_id = apenado_ids[pos]

      unidade.visits.create(apenado_id: apenado_1_id, data_visita: data)
      if count > 1
        unidade.visits.create(apenado_id: apenado_2_id, data_visita: data)
      end

      pos += 1
      if pos > (count -1).to_i
        pos = 0
      end

      i += 1
    end until i > dias

  end

end
