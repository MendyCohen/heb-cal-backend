# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
# Event.destroy_all
# GlobalEvent.destroy_all

10.times {
  User.create(name: Faker::Name.name , latitude: 40.70062, longitude: -74.007230)
 }

10.times {
  Event.create(title: Faker::Military.army_rank, note: Faker::Seinfeld.character, hour: '12:00pm', day: Faker::Date.forward(50), user_id: Random.rand(10))
}

10.times {
  GlobalEvent.create(title: Faker::Military.army_rank, note: Faker::Seinfeld.character, hour: '12:00am', day: Faker::Date.forward(50), user_id: Random.rand(10))
}
