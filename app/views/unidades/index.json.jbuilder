json.array!(@unidades) do |unidade|
  json.extract! unidade, :id, :nome
  json.url unidade_url(unidade, format: :json)
end
