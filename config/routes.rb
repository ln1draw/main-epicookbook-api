MainEpicookbookAPI::Application.routes.draw do
  get  'ingredients'             => 'recipe_ingredients#ingredients'
  get  'index'                   => 'recipe_ingredients#index'
  post 'ingredients'             => 'recipe_ingredients#create'
  get  'components'              => 'recipe_ingredients#components'
  post 'steps'                   => 'directions#create'
  get  'recipes/:id/ingredients' => 'recipes#ingredients'
  post 'ingredient'             => 'recipe_ingredients#new_ingredient'

  resources :recipes
  root  'welcome#index'
end