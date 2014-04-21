class Api::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  APIurl = 'http://www.whatsinmyfood.info/api/'

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
    component_ids = Recipe.get_ingredients_and_component_ids(@recipe_ingredients)
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

  def search_with_filter
    all_recipes = Recipe.all
    nolist_ids = params[:ids].split(',')
    component_id_array = []
    nolist_ids.each do |id|
      list = Nolist.find(id.to_i)
      list.component_lists.each do |cl|
        component_id_array << cl.apid.to_s
      end
    end
    component_id_array.uniq!
    puts "component id array #{component_id_array}"
    @recipes = []
    all_recipes.each do |recipe|
      if recipe.component_ids
        puts "recipe #{recipe.name}"
        recipe_components = recipe.component_ids.split(',')
        puts "recipe components #{recipe_components}"
        all_components = component_id_array + recipe_components
        puts "all components #{all_components}"
        puts ".uniq!.length #{all_components.uniq.length}"
        puts "length #{all_components.length}"
        if all_components.uniq.length == all_components.length
          puts "added #{recipe.name} to the list"
          @recipes << recipe
        end
      end
    end
    puts "@recipes #{@recipes}"
  
    render :index
  end

  private
  def recipe_params
    params.require(:recipe).permit(:name, :id, :ids, :verified, :blurb, :image, :uid, :prep_time, :inactive_time, :recipe_ingredients => {}, :directions => {})
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
  # index show create destroy
end
