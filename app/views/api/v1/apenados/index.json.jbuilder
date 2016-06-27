json.set! :apenados do
  json.array!(@apenados) do |apenado|
    
    json.extract! apenado, :id, :unidade_id, :nome, :termino, :restricoes, :sexo, :nascimento, :mae, :documentos, :naturalidade, :condenado_por, :endereco, :ativo, :motivo_inativo, :outras_informacoes
    
    json.photos (apenado.photos) do |photo|
      json.url photo.image_url(:thumbnail)
    end

  end
end