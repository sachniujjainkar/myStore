# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Script to make fake entries in product table
1000.times do
    Product.create([{
    name:Faker::Commerce.product_name,    
    description:Faker::ChuckNorris.fact,
    sku:Faker::Code.nric,
    quantity:22,
    currency:Faker::Currency.code, 
    price:Faker::Commerce.price,
    images:"https://images.unsplash.com/photo-1535498730771-e735b998cd64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&w=1000&q=80",
    inbox:'Details contents of package'
    }])
end


