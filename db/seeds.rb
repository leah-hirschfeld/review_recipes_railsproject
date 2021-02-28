# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.create(title: "Bagels 2", ingredients: "flour, water, yeast", instructions: "Combine and shape. Boil and bake.")
Review.create(stars: 5, comment: "Best bagel recipe ever!")
User.create(username: "test", email: "test0@aol.com", password: "password")