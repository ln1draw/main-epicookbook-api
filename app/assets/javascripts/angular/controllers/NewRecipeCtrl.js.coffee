@epicookbook.controller "NewRecipeCtrl", [
  "$scope",
  "Restangular",
  "$location",
  ($scope, Restangular) ->

    # instantiates the recipeingredients, which will represent the ingredients
    # actually in the recipe
    $scope.recipeIngredients = []
    #instantiates the rest of the main variables
    $scope.recipe = {}
    $scope.steps = []
    $scope.step = ''
    $scope.newIngredients = []
    $scope.newIngredientName = ''
    $scope.creatingIngredient = false
    $scope.creatingComponent = false

    # this gets all of the components and saves them to the scope
    getComponents = Restangular.all('api/components.json')
    getComponents.getList().then (someComponents) ->
      $scope.components = someComponents

    # helper method to sort. Needs refactoring to take case into account
    compare = (a, b) ->
      return -1  if a.name.toUpperCase() < b.name.toUpperCase()
      return 1  if a.name.toUpperCase() > b.name.toUpperCase()
      0

    # this gets all of the ingredients and saves them to the scope
    getIngredients = Restangular.all("api/ingredients.json")
    getIngredients.getList().then (someIngredients) ->
      ingredients = someIngredients.sort(compare)
      remainder = ingredients.length % 2
      divisor = (ingredients.length - remainder) / 3
      if remainder is 0
        r1 = divisor + 1
      else
        r1 = divisor + 2
      $scope.ingredients1 = ingredients.slice(0, r1)
      $scope.ingredients2 = ingredients.slice(r1, ingredients.length)

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

    # adds a step to the recipe
    $scope.addStep = (step) ->
      # this is kind of a hacky fix to the duplicator problem
      $scope.steps.push {content: step.content, id: $scope.steps.length}
      $scope.step = ''

    # makes the new ingredient form available
    $scope.newIngredient = ->
      if $scope.creatingIngredient
        $scope.creatingIngredient = false
      else
        $scope.creatingIngredient = true

    # adds components to the new ingredient
    $scope.addComponent = (component) ->
      #checks to see if component is in the array by mapping ids
      componentIngredient = {id: component.id, name: component.name}
      ids = $scope.newIngredients.map (item) -> item.id
      #if the component isn't there, it adds the component
      if component.id not in ids
        $scope.newIngredients.push componentIngredient
      #if the component is there, it finds the index based on the id array and
      #then removes the component from the  array at that position
      else
        id = ids.indexOf(component.id)
        $scope.newIngredients.splice(id, 1)

    # creates the new ingredient
    $scope.createIngredient = (newIngredients, newIngredientName) ->
      newIngredient = Restangular.all('api/ingredient.json')
      theIngredient = {name: newIngredientName, components: newIngredients}
      newIngredient.post(theIngredient, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"}).then (recipe) ->
        getIngredients.getList().then (someIngredients) ->
          $scope.ingredients = someIngredients.sort(compare)

    # makes the new component form available
    $scope.newComponent = ->
      if $scope.creatingComponent
        $scope.creatingComponent = false
      else
        $scope.creatingComponent = true


    # creates the new component
    $scope.createComponent = (theNewComponent) ->
      newComponent = Restangular.all('api/component.json')
      newComponent.post({name: theNewComponent}, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"}).then (recipe) ->
        getComponents.getList().then (someComponents) ->
          $scope.components = someComponents

    # client-side validity checks
    $scope.valid = (recipeName, recipeIngredients, steps) ->
      if recipeName.length > 0 and recipe_ingredients.length > 0 and steps.length > 0 and recipe.length != null
        return true
      else
        return false

    # creates a new recipe
    $scope.createRecipe = (recipe, recipeIngredients, steps, uid) ->
      # sets all of the URLs to be called in the API
      recipeAddress = Restangular.all('api/recipes.json')
      recipeIngredientAddress = Restangular.all('api/ingredients.json')
      recipeSteps = Restangular.all('api/steps.json')

      # sets values to be passed for the new recipe
      theRecipe = {uid: uid, blurb: recipe.blurb, image: recipe.image, name: recipe.name, prep_time: recipe.prep_time, inactive_time: recipe.inactive_time, makes: recipe.makes}
      
      # creates a new recipe via an API call and creates a promise object
      recipeAddress.post(theRecipe, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"} ).then (recipe) ->
        # sets values for new recipe_ingredients (basically a join table between
        # recipes and ingredients) and creates the recipe_ingredients

        theIngredients = {recipe_ingredients: recipeIngredients, recipe_id: recipe.id}
        recipeIngredientAddress.post(theIngredients, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"})
        # sets values for new steps (called Directions in rails, because I plan ahead)
        # and creates them

        theSteps = {steps: steps, recipe_id: recipe.id}
        recipeSteps.post(theSteps, {}, {}, {"X-CSRF-Token": $("meta[name=\"csrf-token\"]").attr "content"})
        window.location = "#/recipe/" + recipe.id

    # settings for the semantic ui module
    $(".filter.info").popup on: "click"
]