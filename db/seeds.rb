# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Group.count == 0
    for i in 1..3
        start_date = Date.new(rand(2015..2019), rand(01..12), rand(1..31))
        group = Group.create(
            name: Faker::Cosmere.knight_radiant,
            workout_focus: ["Aerobic", "Strength", "Endurance"].sample,
            active: true,
            duration: ["8 weeks", "6 weeks"].sample,
            start_date: start_date,
            end_date: start_date+(7*8),
            gender: rand(1..3)
        )
        case group.workout_focus
        when "Aerobic"
            group.picture.attach(io: File.open("app/assets/images/group-images/aerobic.jpg"), filename: "aerobic.jpg")
        when "Strength"
            group.picture.attach(io: File.open("app/assets/images/group-images/strength.jpg"), filename: "strength.jpg")
        when "Endurance"
            group.picture.attach(io: File.open("app/assets/images/group-images/endurance.jpg"), filename: "endurance.jpg")
        end
        p "#{group.name}"
        p "#{group.errors.full_messages} - User not created" if !group.errors.empty?
    end
end

if User.count == 0
    for i in 1..20
        user = User.new(
            email: "#{Faker::Ancient.titan}@test.com",
            password: Faker::Lorem.characters(number: 6),
            description: Faker::Lorem.sentence,
            gender: rand(1..2),
            age: rand(18..75),
            username: Faker::Name.name,
        )
        for group in Group.all
            if group.gender == user.gender or group.gender == "both"
                if group.users.count < 6
                    user.group_id = group.id
                    break
                end
            end
        end
        user.save
        picture = Down.download("https://loremflickr.com/320/240/headshot")
        user.picture.attach(io: picture, filename: File.basename(picture.path))
        p "#{user.username} - #{user.email}"
        p user.errors.full_messages if !user.errors.empty?
    end
end