@epicookbook.controller "RecipeCtrl", [
  "$scope"
  "Restangular"
  ($scope, Restangular) ->
    getComponents = Restangular.all('components.json')
    getComponents.getList().then (someComponents) ->
      $scope.components = someComponents

    getIngredients = Restangular.all("ingredients.json")
    getIngredients.getList().then (someIngredients) ->
      $scope.ingredients = someIngredients
      return

]