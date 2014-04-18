class Api::RecipeIngredientsController < ApplicationController

  APIurl = 'http://www.whatsinmyfood.info/api/'

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
    components = []
    params[:components].each do |component|
      components << component[:id]
    end
    to_post = {ingredient: {
      name: params[:name],
      verified: false,
      components: components
      }}
    @ingredient = HTTParty.post( APIurl + 'ingredients.json', 
                                  body: to_post.to_json, 
                                  headers: {'Content-Type' => 'application/json'})
  end

  def new_component
    @component = HTTParty.post( APIurl + 'components.json',
                                body: {component: {name: params[:name]}}.to_json,
                                headers: {'Content-Type' => 'application/json'})
  end
end