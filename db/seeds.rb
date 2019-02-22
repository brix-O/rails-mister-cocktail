require 'open-uri'
require 'json'

# TODO: Write a seed to insert 100 posts in the database

puts 'Cleaning Doses database...'
Dose.destroy_all

puts 'Finished with Doses database!'

puts '####################################'

puts 'Cleaning Ingredients database...'
Ingredient.destroy_all

puts 'Creating fake ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients = JSON.parse(open(url).read)

ingredients['drinks'].each do |i|
  Ingredient.create(
    name: i['strIngredient1']
  )
end

puts 'Finished with Ingredients database!'

puts '####################################'

puts 'Cleaning Cocktails database...'
Cocktail.destroy_all

cocktails_list = [
  {
    name: 'Black Russian',
  },
  {
    name: 'Margarita',
  },
  {
    name: 'Blood Orange & Star Anise',
  },
  {
    name: "Bergamot Mojito",
  },
  {
    name: 'Long Island'
  }
]
Cocktail.create!(cocktails_list)
puts 'Finished with Cocktails database!'

puts "ALL DONE!"
