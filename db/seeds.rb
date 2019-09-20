# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "destroying..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

#ingredients
puts "seeding ingredients..."
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")
Ingredient.create(name: "gin")
Ingredient.create(name: "dry vermouth")
Ingredient.create(name: "port")
Ingredient.create(name: "rum")
Ingredient.create(name: "whisky")
Ingredient.create(name: "coffee")
Ingredient.create(name: "vodka")
Ingredient.create(name: "cream")
Ingredient.create(name: "coffee liqueur")
puts "#{Ingredient.count} ingredients created!"

puts "creating cocktails..."
10.times do |x|
  Cocktail.create(name: "cocktail#{x}")
end

puts "done"

#doses
descriptions = ["10cl", "20cl", "30cl"]
puts "seeding doses..."


Dose.create(description: descriptions.sample, cocktail: Cocktail.first, ingredient: Ingredient.first)
Dose.create(description: descriptions.sample, cocktail: Cocktail.last, ingredient: Ingredient.last)

puts "done"
