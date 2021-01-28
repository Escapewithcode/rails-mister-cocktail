# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "json"


puts "Cleaning database..."

Cocktail.destroy_all
Dose.destroy_all
Ingredient.destroy_all

puts "Creating ingredients..."
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
drinks_serialized = open(url).read
drinksHash = JSON.parse(drinks_serialized)

drinksHash["drinks"].each do |drink|
  puts "Creating #{drink["strIngredient1"]}"
  Ingredient.create(name: drink["strIngredient1"])
end
