require 'open-uri'

puts "Destroy Doses"
Dose.destroy_all

puts "Destroy ingredients"
Ingredient.destroy_all

puts "Destroy Cocktails"
Cocktail.destroy_all

puts "Create ingredients"
url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

Ingredient.create(name: "Lemon")
Ingredient.create(name: "Ice")
Ingredient.create(name: "Mint leaves")

puts "Finished!"
