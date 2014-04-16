@epicookbook.controller "SearchCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams) ->

    $scope.search = (query) ->
      window.location = "#/search/" + query

      $scope.recipeQuery = $routeParams.recipeQuery
]