require 'open-uri'
require 'json'

# TODO: Write a seed to insert 100 posts in the database

puts 'Cleaning database...'
Ingredient.destroy_all

puts "Creating fake ingredients..."

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |i|
  Ingredient.create(
    name: i['strIngredient1']
  )
end

puts "Finished!"
