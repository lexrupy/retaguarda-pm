json.set! :ordens do
  json.array!(@opos) do |opo|
    json.extract! opo, :id, :unidade_id, :numero, :descricao, :inicio, :fim, :texto
  #  json.url opo_url(opo, format: :json)
  end
end
