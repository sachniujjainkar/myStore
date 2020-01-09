# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do

    Product.create([{
    firstname:Faker::Name.name,    
    description:Faker::String.random,
    sku:Faker::Code.nric,
    quantity:Faker::Number.decimal_part(digits: 2),
    currency:Faker::Currency.code, 
    price:Faker::Number.decimal(l_digits: 3),
    imges:Faker::Avatar.image(slug: "my-own-slug", size: "50x50", format: "jpg"),
    inbox:Faker::string.random
    }])

end