class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      render action: 'show', status: :created, location: @recipe
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
    @recipe_ingredients = RecipeIngredient.where(recipe_id: params[:id].to_i)
    @ingredients = []
    @recipe_ingredients.each do |recipe_ingredient|
      ingredients << HTTParty.get( APIurl + 'ingredients/' + recipe_ingredient.id)
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :id, :verified, :blurb, :image, :user_id, :prep_time, :inactive_time, :recipe_ingredients => {}, :directions => {})
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  # index show create destroy
end
