# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
cities = [
  'New York City',
  'Los Angeles',
  'Chicago',
  'Houston',
  'Philadelphia',
  'Phoenix',
  'San Antonio',
  'San Diego',
  'Dallas',
  'San Jose'
]

games = [
  'Baseball',
  'Basketball',
  'Table Tennis',
  'Volleyball',
  'Field Hockey',
  'Cricket',
  'Association Football',
  'Rugby Football',
  'Golf',
  'Tennis'
]

20.times do
  Player.create(
    name: Faker::FunnyName.name,
    city: cities[Random.rand(10)],
    game: games[Random.rand(10)],
    rating: Random.rand(6),
    balance: Random.rand(-500..10000000),
    winnings: Random.rand(0..9999999)
  )
end