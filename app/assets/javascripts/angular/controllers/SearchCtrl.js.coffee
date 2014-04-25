@epicookbook.controller "SearchCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  'UserApp',
  ($scope, Restangular, $routeParams, $location, UserApp) ->
    $scope.recipeQuery = $routeParams.recipeQuery
    $scope.query = $routeParams.recipeQuery
    $scope.filters = $routeParams.filters

    # this gets all of the recipes that are not filtered out and saves them to the scope
    if $routeParams.filters is undefined
      getRecipes = Restangular.all('api/recipes.json')
      getRecipes.getList().then (someRecipes) ->
        $scope.recipes = someRecipes
    else
      getRecipes = Restangular.all('api/search/' + $scope.filters + '.json')
      getRecipes.getList().then (someRecipes) ->
        $scope.recipes = someRecipes
    $scope.show = (id) ->
      window.location = "#/recipe/" + id
]