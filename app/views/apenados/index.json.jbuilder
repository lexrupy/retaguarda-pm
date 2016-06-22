json.array!(@apenados) do |apenado|
  json.extract! apenado, :id, :nome, :termino, :restricoes, :sexo, :nascimento, :mae, :documentos, :naturalidade, :condenado_por, :endereco, :ativo, :motivo_inativo
  json.url apenado_url(apenado, format: :json)
end
