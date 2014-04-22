@epicookbook.controller "RecipesCtrl", [
  "$scope"
  "Restangular"
  "$routeParams"
  "$location"
  ($scope, Restangular, $routeParams, $location) ->

    # this gets all of the recipes and saves them to the scope
    getRecipes = Restangular.all('api/recipes.json')
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes

    $scope.show = (id) ->
      window.location = "#/recipe/" + id
]