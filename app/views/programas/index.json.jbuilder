json.array!(@programas) do |programa|
  json.extract! programa, :id, :descricao, :data_inicio, :data_fim, :unidade_id
  json.url programa_url(programa, format: :json)
end
