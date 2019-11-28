# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

for i in 1..20
    user = User.create(
        email: "#{Faker::Ancient.titan}@test.com",
        password: Faker::Lorem.characters(number: 6),
        description: Faker::Lorem.sentence,
        gender: rand(1..2),
        age: rand(18..75),
        username: Faker::Name.name
    )
    picture = Down.download("https://loremflickr.com/320/240/headshot")
    user.picture.attach(io: picture, filename: File.basename(picture.path))
    p user.errors.full_messages
    p "#{User.last.username} - #{User.last.email}"
end