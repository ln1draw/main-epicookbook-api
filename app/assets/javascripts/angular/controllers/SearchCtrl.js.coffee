@epicookbook.controller "SearchCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams) ->
    $scope.recipeQuery = $routeParams.recipeQuery
    $scope.routeParams = $routeParams

    $scope.search = (recipeQuery) ->
      window.location = "#/search/" + recipeQuery

      $scope.recipeQuery = $routeParams.recipeQuery

    # this gets all of the recipes and saves them to the scope
    getRecipes = Restangular.all('api/recipes.json')
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes

    
]