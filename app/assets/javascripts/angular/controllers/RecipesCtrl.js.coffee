@epicookbook.controller "RecipesCtrl", [
  "$scope"
  "Restangular"
  "$routeParams"
  ($scope, Restangular, $routeParams) ->

    # this gets all of the recipes and saves them to the scope
    getRecipes = Restangular.all('api/recipes.json')
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes

    # this gets the appropriate chunk of recipes 
]