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
    params[:recipe_ingredients].each do |ri|
      RecipeIngredient.create(
        unit: ri[:unit],
        quantity: ri[:quantity],
        ingredient_id: ri[:id],
        recipe_id: params[:recipe_id]
      )
    end
    redirect_to 'index'
  end
end