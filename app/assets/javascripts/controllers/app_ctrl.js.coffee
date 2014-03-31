angular.module('chatroom').controller 'AppCtrl', ['$scope', '$http', ($scope, $http) ->

  $scope.dispatcher = new WebSocketRails('localhost:3000/websocket')

  $scope.dispatcher.bind 'chatroom.messages.create', (message) ->
    console.log message

]