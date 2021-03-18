require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
puts "Creating ingredients..."



url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient = JSON.parse(ingredient_serialized)
ingredients = ingredient["drinks"]
ingredients.each do |ing|
  Ingredient.create(name: ing["strIngredient1"])
end

puts "Creating cocktails..."

Cocktail.create(name: "Mojito")
Cocktail.create(name: "BloodyMary")
Cocktail.create(name: "sex on the beach")
Cocktail.create(name: "Margarita")
Cocktail.create(name: "Pina Colada")

puts "Finished!"
