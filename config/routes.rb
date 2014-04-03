MainEpicookbookAPI::Application.routes.draw do
  defaults format: :json do 
    resources :recipes
  end
end