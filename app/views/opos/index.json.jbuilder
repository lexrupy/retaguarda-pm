json.array!(@opos) do |opo|
  json.extract! opo, :id, :unidade_id, :numero, :descricao, :data_inicio, :data_fim, :texto
  json.url opo_url(opo, format: :json)
end
