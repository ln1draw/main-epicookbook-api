class RecipeIngredientsController < ApplicationController

  APIurl = 'http://localhost:4000/api/'

  def index
    @recipe_ingredients = RecipeIngredient.all
    @ingredients = []
    @recipe_ingredients.each do |recipe_ingredient|
      ingredients << HTTParty.get( APIurl + 'ingredients/' + recipe_ingredient.id)
    end
  end

  def ingredients
    @ingredients = HTTParty.get( APIurl + 'ingredients.json')
  end

  def components
    @components = HTTParty.get( APIurl + 'components.json')
  end

  def create
    @recipe_ingredients = []
    params[:recipe_ingredients].each do |ri|
      @recipe_ingredients << RecipeIngredient.create(
        unit: ri[:unit],
        quantity: ri[:quantity],
        ingredient_id: ri[:id],
        recipe_id: params[:recipe_id]
      )
    end
  end

  def new_ingredient
    pi = params[:ingredient]
    to_post = {ingredient: {
      name: pi[:name],
      verified: false,
      components: pi[:components]
      }}
    @ingredient = HTTParty.post( APIurl + 'ingredients.json', to_post)
  end
end