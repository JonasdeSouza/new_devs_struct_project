# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  Product.create(name: 'sukita', brand: 'doBem', volume:'1L', alcoholic: false, category_id: 1, quantity: 4, price: 3.99)
  Category.create(name: 'suco')