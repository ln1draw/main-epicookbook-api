MainEpicookbookAPI::Application.routes.draw do
  get 'ingredients' => 'recipe_ingredients#index'
  get 'components' => 'recipe_ingredients#components'
  resources :recipes
  root 'welcome#index'
end