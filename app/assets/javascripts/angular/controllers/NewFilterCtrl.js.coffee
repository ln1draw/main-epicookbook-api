@epicookbook.controller "NewFilterCtrl", [
  "$scope",
  "Restangular",
  "$location",
  ($scope, Restangular) ->

    $scope.filter = {}
    $scope.newFilter = []

    # this gets all of the components and saves them to the scope
    getComponents = Restangular.all('components.json')
    getComponents.getList().then (someComponents) ->
      $scope.components = someComponents

    # adds components to the new filter
    $scope.addComponent = (component) ->
      #checks to see if component is in the array by mapping ids
      componentFilter = {id: component.id, name: component.name}
      ids = $scope.newFilter.map (item) -> item.id
      #if the component isn't there, it adds the component
      if component.id not in ids
        $scope.newFilter.push componentFilter
      #if the component is there, it finds the index based on the id array and
      #then removes the component from the  array at that position
      else
        id = ids.indexOf(component.id)
        $scope.newFilter.splice(id, 1)

    # creates the actual filter
    $scope.createFilter = (filterName, newFilter) ->
      filterAddress = Restangular.all('filters.json')
      filterParams = {name: filterName, components: newFilter}
      recipeIngredientAddress.post(filterParams, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"})

]