json.success Settings.success
json.coin_histories @coin_histories.each do |coin_history|
  json.id coin_history.id
  promotion = coin_history.promotion
  json.promotion do
    json.id promotion.id
    json.name promotion.name
  end
  json.point coin_history.point
  json.date coin_history.created_at.to_i
end
