@epicookbook.controller "NewSearchCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams, $location) ->
    $scope.recipeQuery = $routeParams.recipeQuery
    $scope.auser = $scope.user_id
    $scope.recipeQuery = $routeParams.recipeQuery

    # the actual method that moves you to the search page (executes on click)
    $scope.search = (recipeQuery, selectedFilters) ->     
      if selectedFilters
        theFilters = selectedFilters.map (item) -> item.id
        newLocation = "#/search/" + recipeQuery + "/" + theFilters.join()
      else
        newLocation = "#/search/" + recipeQuery
      window.location = newLocation

    # method that runs to get a user's ids when you click on 'add a filter'
    $scope.getFilters = (uid) ->
      getFilters = Restangular.all('api/users/' + uid + '/nolists.json')
      getFilters.getList().then (someFilters) ->
        $scope.filters = someFilters

    #the method for putting a filter in the selectedFilters array
    $scope.addFilter = (filter) ->
      #checks to see if filter is in the array by mapping ids
      searchFilter = {id: filter.id, name: filter.name}
      if $scope.selectedFilters is undefined
        $scope.selectedFilters = []
      ids = $scope.selectedFilters.map (item) -> item.id
      #if the filter isn't there, it adds the filter
      if filter.id not in ids
        $scope.selectedFilters.push searchFilter
      #if the filter is there, it finds the index based on the id array and
      #then removes the filter from the selectedFilters array at that position
      else
        id = ids.indexOf(filter.id)
        $scope.selectedFilters.splice(id, 1)

    $scope.reloadRoute = ->
      $route.reloadRoute
]