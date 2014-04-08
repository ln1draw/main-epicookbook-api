'use strict'

@epicookbook = angular.module('epicookbook', [
  'ngRoute',
  'UserApp'
  ])

epicookbook.config([
  "$routeProvider"
  ($routeProvider) ->
    $routeProvider.when("/components",
      templateUrl: "../templates/components.html"
      controller: "ComponentsController"
    ).when("/login",
      templateUrl: "../templates/user/login.html"
      public: true
      login: true
    ).when("/signup",
      templateUrl: "../templates/user/signup.html"
      public: true
    ).when("/profile",
      templateUrl: "../templates/user/profile.html"
    ).when("/verify-email",
      templateUrl: "../templates/user/verify-email.html"
      verify_email: true
    ).when("/reset-password",
      templateUrl: "../templates/user/reset-password.html"
      public: true
    ).when("/set-password",
      templateUrl: "../templates/user/set-password.html"
      set_password: true
    ).when("/recipe/new",
      templateUrl: "../templates/recipe/new.html"
      controller: "RecipeController"
    ).otherwise templateUrl: "../templates/home.html"
]).run ($rootScope, user) ->
  user.init appId: "5339e04524d20"
  return
