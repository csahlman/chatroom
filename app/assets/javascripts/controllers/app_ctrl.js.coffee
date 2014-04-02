angular.module('chatroom').controller 'AppCtrl', ['$scope', '$http', ($scope, $http) ->

  $scope.currentUser = null

  $scope.userSignedIn = ->
    $scope.currentUser != null

  $scope.user = (user) ->
    $scope.currentUser = user

  $scope.dispatcher = new WebSocketRails('localhost:3000/websocket')

  # $scope.dispatcher.on_open = (data) ->
  #   console.log data

  $scope.dispatcher.on_close = (data) ->
    console.log 'connection closed'

]