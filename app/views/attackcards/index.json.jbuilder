json.array!(@attackcards) do |attackcard|
  json.extract! attackcard, :id, :name, :cost, :damage, :description
  json.url attackcard_url(attackcard, format: :json)
end
