# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Region.destroy_all


User.create(name: "Patrick", username: "PAkolo", email: "PAkolo@hotmail.com", password: "password")

Region.create!(
    [
        {
            continent: "Africa",
            country: "Kenya",
            state: "Mombasa"
        },
        {
            continent:"North America",
            country:"U.S.A",
            state:"Maryland"
        },
        {
            continent:"North America",
            country:"Mexico",
            state: "Mexico city"
        },
        {
            continent:"Asia",
            country:"India",
            state:"New Dheli"
        }
    ]
)


puts "after seeding the database:"
puts "... There are #{User.count} users."
puts "... There are #{Region.count} Regions."