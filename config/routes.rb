MainEpicookbookAPI::Application.routes.draw do
  get 'ingredients' => 'recipe_ingredients#index'
  resources :recipes
  root 'welcome#index'
end