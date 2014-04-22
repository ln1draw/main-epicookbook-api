@epicookbook.controller "NewFilterCtrl", [
  "$scope",
  "Restangular",
  "$location",
  ($scope, Restangular) ->

    $scope.filter = {}
    $scope.newFilter = []

    # this gets all of the components and saves them to the scope
    getComponents = Restangular.all('api/components.json')
    getComponents.getList().then (someComponents) ->
      components = someComponents
      remainder = components.length % 3
      divisor = (components.length - remainder) / 3
      if remainder is 0
        r1 = -1 + divisor
        r2 = -1 + divisor
      else if remainder is 1
        r1 = divisor
        r2 = -1 + divisor
      else
        r1 = divisor
        r2 = divisor
      $scope.components1 = components.slice(0, r1 + 1)
      $scope.components2 = components.slice(r1 + 1, r1 + r2 + 2)
      $scope.components3 = components.slice(r1 + r2 + 2, components.length)

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
    $scope.createFilter = (filterName, newFilter, uid) ->
      filterAddress = Restangular.all('api/nolists.json')
      filterParams = {name: filterName, components: newFilter, uid: uid}
      filterAddress.post(filterParams, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"}).then (filter) ->
        window.location = "#/filter/" + filter.id

    # settings for the semantic ui module
    $(".filter.info").popup on: "click"
]