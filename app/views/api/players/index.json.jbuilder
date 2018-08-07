json.players @players.each do |player|
  json.id player.id
  json.created_at l(player.created_at, format: :default)
  json.name player.name
  json.game player.game
  json.city player.city
  json.rating player.rating
  json.balance player.balance
  json.winnings player.winnings
end