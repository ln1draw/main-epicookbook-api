class RecipeIngredientsController < ApplicationController

  APIurl = 'http://localhost:4000/api/'

  def index
    @ingredients = HTTParty.get( APIurl + 'ingredients.json')
  end

  def components
    @components = HTTParty.get( APIurl + 'components.json')
  end
end