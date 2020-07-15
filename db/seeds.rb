# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(name: 'Sucos')
Category.create(name: 'Refrigerante')
Category.create(name: 'Cervejas')
Category.create(name: 'Destilados')
Category.create(name: 'Vinhos')


sukita = Product.create(name: 'sukita', brand: 'doBem', volume:'1L', alcoholic: false, category_id: 1, quantity: 4, price: 3.99)

User.create({"name"=>"admin", "email"=>"admin@admin.com", "password"=>"admin", "cpf"=>"010101010", "birth_date"=>"0101-01-01", "adm"=>true, "addresses_attributes"=>{"0"=>{"name"=>"test", "cep"=>"", "street"=>"", "complement"=>"", "neighborhood"=>"", "city"=>"", "state"=>""}}})