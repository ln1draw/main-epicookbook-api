@epicookbook.controller "RecipesCtrl", [
  "$scope"
  "Restangular"
  ($scope, Restangular) ->

    # this gets all of the recipes and saves them to the scope
    getRecipes = Restangular.all('api/recipes.json')
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes
]