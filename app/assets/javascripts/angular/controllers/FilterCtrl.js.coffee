@epicookbook.controller "FilterCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams) ->

    $scope.filterId = $routeParams.filterId

    getFilter = Restangular.one('nolists/' + $scope.filterId + '.json').get().then (theFilter) ->
      $scope.filter = theFilter


]