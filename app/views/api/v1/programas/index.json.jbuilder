json.set! :programas do
  json.array!(@programas) do |pr|
    
    json.id pr.id 
    json.descricao pr.descricao
    json.data_inicio data_str(pr.data_inicio)
    json.data_fim data_str(pr.data_fim)

    json.setores (current_user.unidade.setores) do |set|
      json.id set.id
      json.nome set.nome
    end

    json.residencias (pr.residencias) do |re|
      json.id re.id
      json.setor_id re.setor_id
      json.telefones re.telefones
      json.nome re.nome
      json.endereco re.endereco
      json.data_saida data_str(re.data_saida)
      json.retorno_previsto data_str(re.retorno_previsto)
      json.ja_retornou re.ja_retornou
      json.data_retorno data_str(re.data_retorno)
      json.informacoes_complementares re.informacoes_complementares
    end
    
  end
end