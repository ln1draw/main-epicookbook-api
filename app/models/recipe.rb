class Recipe < ActiveRecord::Base
  validates_presence_of :name
  has_many :recipe_ingredients
  has_many :directions
end
