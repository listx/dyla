json.array!(@gamestates) do |gamestate|
  json.extract! gamestate, :id
  json.url gamestate_url(gamestate, format: :json)
end
