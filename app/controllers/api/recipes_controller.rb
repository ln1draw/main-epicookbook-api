class Api::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  APIurl = 'http://localhost:4000/api/'

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render action: 'show', status: :created, location: [:api, @recipe]
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      head :no_content
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    head :no_content
  end

  def ingredients
    id = params[:id].to_i
    @recipe_ingredients = RecipeIngredient.where(recipe_id: id)
    @ingredients = []
    component_ids = []
    @recipe_ingredients.each do |recipe_ingredient|
      ingredient = HTTParty.get( APIurl + 'ingredients/' + recipe_ingredient.ingredient_id.to_s + '.json')
      @ingredients << ingredient
      ingredient.parsed_response['ingredient']['components'].each do |componet_id|
        component_ids << componet_id
      end
    end
    component_ids.uniq!
    @components = []
    component_ids.each do |component_id|
      component = HTTParty.get( APIurl + 'components/' + component_id.to_s + '.json')
      @components << component
    end
  end

  def directions
    id = params[:id].to_i
    @directions = Direction.where(recipe_id: id)
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :id, :verified, :blurb, :image, :uid, :prep_time, :inactive_time, :recipe_ingredients => {}, :directions => {})
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  # index show create destroy
end
