MainEpicookbookAPI::Application.routes.draw do
  namespace :api, defaults: {format: :json} do
    get  'ingredients'             => 'recipe_ingredients#ingredients'
    get  'index'                   => 'recipe_ingredients#index'
    post 'ingredients'             => 'recipe_ingredients#create'
    get  'components'              => 'recipe_ingredients#components'
    post 'steps'                   => 'directions#create'
    get  'recipes/:id/ingredients' => 'recipes#ingredients'
    post 'ingredient'              => 'recipe_ingredients#new_ingredient'
    get  'recipes/:id/steps'       => 'recipes#directions'
    post 'nolists'                 => 'nolists#create'
    get  'nolists/:id'             => 'nolists#show'
    post 'component'               => 'recipe_ingredients#new_component'
    get  'users/:uid/nolists'      => 'nolists#by_uid'
    get  'search/:ids'             => 'recipes#search_with_filter'

    resources :recipes
  end
  
  get "/*path" => redirect("/?goto=%{path}")
  root  'welcome#index'
end