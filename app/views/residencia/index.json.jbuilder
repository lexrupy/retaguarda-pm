json.array!(@residencia) do |residencium|
  json.extract! residencium, :id, :telefones,, :nome, :endereco, :data_saida, :retorno_previsto, :ja_retornou, :data_retorno, :informacoes_complementares, :unidade_id, :programa_id
  json.url residencium_url(residencium, format: :json)
end
