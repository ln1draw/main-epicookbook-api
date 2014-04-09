# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recipe_ingredient do
    ingredient_id 1
    recipe_id 1
    quantity 1
    unit "MyString"
  end
end
