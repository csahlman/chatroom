angular.module('chatroom').controller 'ChatroomCtrl', ['$scope', '$http', '$timeout', ($scope, $http, 
  $timeout) ->

  $scope.messages = []

  $scope.newMessage = {}

  new_chatroom = $scope.dispatcher.subscribe('new_chatroom')

  new_chatroom.bind 'messages.create', (message) ->
    $scope.messages.push message
    $scope.$apply()

  $scope.createMessage = ->
    new_chatroom.trigger('messages.create', $scope.newMessage)
    $scope.newMessage = {}

]