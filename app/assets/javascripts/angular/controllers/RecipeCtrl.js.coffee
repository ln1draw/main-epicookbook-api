@epicookbook.controller "RecipeCtrl", [
  "$scope"
  "Restangular"
  ($scope, Restangular) ->
    getRecipes = Restangular.all("recipes.json")
    getRecipes.getList().then (someRecipes) ->
      $scope.recipes = someRecipes
      return
    getIngredients = Restangular.all("ingredients.json")
    getIngredients.getList().then (someIngredients) ->
      $scope.ingredients = someIngredients
      return
]