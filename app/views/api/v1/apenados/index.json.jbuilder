json.set! :apenados do
  json.array!(@apenados) do |ap|
    
    json.id ap.id
    json.unidade_id ap.unidade_id
    json.nome ap.nome
    json.termino data_str(ap.termino)
    json.restricoes ap.restricoes
    json.sexo ap.sexo
    json.nascimento data_str(ap.nascimento)
    json.mae ap.mae
    json.documentos ap.documentos
    json.naturalidade ap.naturalidade
    json.condenado_por ap.condenado_por
    json.endereco ap.endereco
    json.ativo ap.ativo
    json.motivo_inativo ap.motivo_inativo
    json.outras_informacoes ap.outras_informacoes
    
    json.photos (ap.photos) do |photo|
      json.url photo.image_url(:thumbnail)
    end

  end
end