class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :recipe_ingredients
  has_many :directions

  mount_uploader :image, ImageUploader

  def self.get_ingredients_and_component_ids(recipe_ingredients)
    ingredients = []
    component_ids = []
    recipe_ingredients.each do |recipe_ingredient|
      ingredient = HTTParty.get('http://www.whatsinmyfood.info/api/ingredients/' + recipe_ingredient.ingredient_id.to_s + '.json')
      ingredients << ingredient
      ingredient.parsed_response['ingredient']['components'].each do |component_id|
        component_ids << component_id
      end
    end
    component_ids.uniq!
    return [component_ids, ingredients]
  end
end
