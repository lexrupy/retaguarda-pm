json.array!(@users) do |user|
  json.extract! user, :id, :matricula, :nome
  json.url user_url(user, format: :json)
end
