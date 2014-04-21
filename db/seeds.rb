# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Direction.create([
  {recipe_id: 1, content: "Freeze the bananas"},
  {recipe_id: 1, content: "Blend the bananas, milk, and nut butter until smooth"},
  {recipe_id: 1, content: "Adjust by adding more of one ingredient or another until the mixture is creamy"}
])

RecipeIngredient.create([
  {ingredient_id: 1, recipe_id: 1, quantity: 1, unit: "bunch"},
  {ingredient_id: 2, recipe_id: 1, quantity: 1, unit: "cup"},
  {ingredient_id: 3, recipe_id: 1, quantity: 1, unit: "cup"}
])

Recipe.create([
  {
    blurb: "The tastiest non-dairy ice cream you'll ever nom", 
    image: "http://www.placekitten.com/50/50",
    uid: 1,
    prep_time: 5,
    inactive_time: 600,
    makes: '4 servings',
    verified: true,
    name: "Banana 'ice cream'",
    component_ids: '1,2'
  },  
])