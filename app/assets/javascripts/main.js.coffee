'use strict'

@epicookbook = angular.module('epicookbook', [
  'ngRoute',
  'UserApp',
  'restangular',
  ])

epicookbook.config([
  "$routeProvider",
  "$locationProvider",
  ($routeProvider, $locationProvider) ->
    
    $routeProvider

    .when("/login",
      templateUrl: "../templates/user/login.html"
      public: true
      login: true
    )

    .when("/signup",
      templateUrl: "../templates/user/signup.html"
      public: true
    )

    .when("/profile",
      templateUrl: "../templates/user/profile.html"
    )

    .when("/verify-email",
      templateUrl: "../templates/user/verify-email.html"
      verify_email: true
    )

    .when("/reset-password",
      templateUrl: "../templates/user/reset-password.html"
      public: true
    )

    .when("/set-password",
      templateUrl: "../templates/user/set-password.html"
      set_password: true
    )

    .when("/recipe/new",
      templateUrl: "../templates/recipe/new.html"
      controller: "NewRecipeCtrl"
    )

    .when("/recipes",
      templateUrl: "../templates/recipe/index.html"
      controller: "RecipesCtrl"
    )

    .when("/recipe/:recipeId",
      templateUrl: "../templates/recipe/show.html"
      controller: "RecipeCtrl"
    )

    .otherwise templateUrl: "../templates/home.html"
])

.run ($rootScope, user) ->
  user.init appId: "5339e04524d20"
  return
