class RecipeIngredientsController < ApplicationController
  def index
    @recipe_ingredients = HTTParty.get('http://localhost:4000/ingredients')
  end
end