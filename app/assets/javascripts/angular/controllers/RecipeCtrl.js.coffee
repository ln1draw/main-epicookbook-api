@epicookbook.controller "RecipeCtrl", [
  "$scope",
  "Restangular",
  "$routeParams",
  "$location",
  ($scope, Restangular, $routeParams) ->
    $scope.recipeId = $routeParams.recipeId

    getIngredients = Restangular.one('api/recipes/' + $scope.recipeId + '/ingredients.json').get().then (theIngredients) ->
      $scope.ingredients = theIngredients['ingredients']
      $scope.recipe_ingredients = theIngredients['recipe_ingredients']
      $scope.components = theIngredients['components']['components']

    $scope.ingredientStats = (ingredient) ->
      ingredient_id = ingredient.ingredient.id
      for recipe_ingredient in $scope.recipe_ingredients
        if recipe_ingredient.ingredient_id is ingredient_id
          ingredient.recipe_ingredient = recipe_ingredient.quantity + ' ' + recipe_ingredient.unit
      return ingredient.recipe_ingredient

    $scope.ingredientComponents = (ingredient) ->
      ingredient.ingredient.component_names = []
      for component_id in ingredient.ingredient.components
        do(component_id) ->
          for component in $scope.components
            if component_id is component.id
              ingredient.ingredient.component_names.push component.name

      # ingredient.ingredient.component_names.push $scope.components
      return ingredient.ingredient.component_names
      # return [{name: 'foo'}, {name: 'bar', components: ingredient.ingredient.components}]

    getSteps = Restangular.all('api/recipes/' + $scope.recipeId + '/steps.json').getList().then (theSteps) ->
      $scope.steps = theSteps
    
    # begins the promise object that relies on details from the recipe
    # everything that relies on the recipe is inside this block
    getRecipe = Restangular.one('api/recipes/' + $scope.recipeId + '.json').get()
    getRecipe.then (aRecipe) ->
      $scope.recipe = aRecipe

      if $scope.recipe.verified is true
        $scope.verified = 'This is a verified recipe!'
        # $scope.verifiedStyle = {}
      else
        $scope.verified = 'WARNING: This recipe is not verified!'
        # $scope.verifiedStyle = {color: red}
]