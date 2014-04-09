class Direction < ActiveRecord::Base
  belongs_to :recipe
  validates_presence_of :recipe_id
  validates_presence_of :content
end
