json.array!(@tacticscards) do |tacticscard|
  json.extract! tacticscard, :id, :name, :cost, :description
  json.url tacticscard_url(tacticscard, format: :json)
end
