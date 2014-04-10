@epicookbook.controller "RecipeCtrl", [
  "$scope"
  "Restangular"
  ($scope, Restangular) ->

    # instantiates the recipeingredients, which will represent the ingredients
    # actually in the recipe
    $scope.recipeIngredients = []

    # this gets all of the components and saves them to the scope
    getComponents = Restangular.all('components.json')
    getComponents.getList().then (someComponents) ->
      $scope.components = someComponents

    # this gets all of the ingredients and saves them to the scope
    getIngredients = Restangular.all("ingredients.json")
    getIngredients.getList().then (someIngredients) ->
      $scope.ingredients = someIngredients

    # This toggles view of the components of a particular ingredient
    $scope.show = (ingredient) ->
      if ingredient.notHidden
        ingredient.notHidden = false
      else
        ingredient.notHidden = true
    
    #the method for putting an ingredient in the recipeIngredients array
    $scope.addIngredient = (ingredient) ->
      #checks to see if ingredient is in the array by mapping ids
      recipeIngredient = {id: ingredient.id, name: ingredient.name}
      ids = $scope.recipeIngredients.map (item) -> item.id
      #if the ingredient isn't there, it adds the ingredient
      if ingredient.id not in ids
        $scope.recipeIngredients.push recipeIngredient
      #if the ingredient is there, it finds the index based on the id array and
      #then removes the ingredient from the recipeIngredients array at that position
      else
        id = ids.indexOf(ingredient.id)
        $scope.recipeIngredients.splice(id, 1)
]