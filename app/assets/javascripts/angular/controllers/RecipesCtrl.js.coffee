@epicookbook.controller "RecipesCtrl", [
  "$scope"
  "Restangular"
  ($scope, Restangular) ->

    # this gets all of the components and saves them to the scope
    getRecipes = Restangular.all('recipes.json')
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes
]