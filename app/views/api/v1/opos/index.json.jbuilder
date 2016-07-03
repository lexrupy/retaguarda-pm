json.set! :ordens do
  json.array!(@opos) do |opo|
    json.id opo.id
    json.unidade_id opo.unidade_id
    json.numero opo.numero
    json.descricao opo.descricao
    json.inicio data_str(opo.data_inicio)
    json.fim data_str(opo.data_fim)
    json.hora opo.hora
    json.local opo.local
    json.evento opo.evento
    json.solicitante opo.solicitante
    json.texto opo.texto
  end
end