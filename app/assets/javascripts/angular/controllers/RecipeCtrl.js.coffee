@epicookbook.controller "RecipeCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams) ->
    $scope.recipeId = $routeParams.recipeId

    getIngredients = Restangular.one('recipes/' + $scope.recipeId + '/ingredients.json').get().then (theIngredients) ->
      $scope.ingredients = theIngredients

    getSteps = Restangular.one('recipes/' + $scope.recipeId + '/steps.json').getList().then (theSteps) ->
      $scope.steps = theSteps
    
    # begins the promise object that relies on details from the recipe
    # everything that relies on the recipe is inside this block
    getRecipe = Restangular.one('recipes/' + $scope.recipeId + '.json').get().then (aRecipe) ->
      $scope.recipe = aRecipe

      if $scope.recipe.verified is true
        $scope.verified = 'This is a verified recipe!'
        # $scope.verifiedStyle = {}
      else
        $scope.verified = 'WARNING: This recipe is not verified!'
        # $scope.verifiedStyle = {color: red}
]