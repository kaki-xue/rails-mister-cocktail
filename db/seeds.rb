# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
Dose.destroy_all if Rails.env.development?
Ingredient.destroy_all if Rails.env.development?
Cocktail.destroy_all if Rails.env.development?


response = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list')
json = JSON.parse(response.read)
json["drinks"].each do |ingredient|
  Ingredient.create!(name: ingredient['strIngredient1'])
end

# Cocktail.create(name: 'Dragon', description: 'Symbolised by three broken or yin lines, this trigram is called K’un or the Earth. The Earth is entirely yin or feminine and represents fertility. As the creative principle, she is the mother of all things and she is dark and devoted, and warm and receptive.')

# Cocktail.create(name: 'Earth', description: 'Symbolised by three broken or yin lines, this trigram is called K’un or the Earth. The Earth is entirely yin or feminine and represents fertility. As the creative principle, she is the mother of all things and she is dark and devoted, and warm and receptive.')
