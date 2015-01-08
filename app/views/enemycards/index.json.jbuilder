json.array!(@enemycards) do |enemycard|
  json.extract! enemycard, :id, :lvl, :name, :damage, :hp, :vp, :tp, :description
  json.url enemycard_url(enemycard, format: :json)
end
