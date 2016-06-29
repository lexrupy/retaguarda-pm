json.set! :visitas do
  json.array!(@visitas) do |visita|
    json.extract! visita, :id, :unidade_id, :apenado_id, :data_visita
  end
end