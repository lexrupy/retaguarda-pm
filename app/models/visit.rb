class Visit < ActiveRecord::Base
  belongs_to :apenado

  def apenado_nome
    apenado.nome if apenado
  end


  def self.gerar_visitas(data_final)
    Visit.where('data_visita >= ?', Date.today).destroy_all
    dias = (data_final.to_date - Date.today.to_date).to_i
    apenado_ids = Apenado.ids.shuffle
    pos = 0
    i = 0
    begin
      data = i.day.from_now
      apenado_1_id = apenado_ids[pos]
      pos += 1
      if pos > apenado_ids.size - 1
        pos = 0
      end
      apenado_2_id = apenado_ids[pos]

      Visit.create(apenado_id: apenado_1_id, data_visita: data)
      Visit.create(apenado_id: apenado_2_id, data_visita: data)

      pos += 1
      if pos > apenado_ids.size -1
        pos = 0
      end

      i += 1
    end until i > dias

  end

end
