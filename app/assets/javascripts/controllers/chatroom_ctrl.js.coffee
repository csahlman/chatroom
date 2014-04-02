angular.module('chatroom').controller 'ChatroomCtrl', ['$scope', '$http', '$timeout', ($scope, $http, 
  $timeout) ->

  $scope.chatters = []

  $scope.$safeApply = ->
    $scope.$apply() unless $scope.$$phase

  $scope.messages = []

  $scope.newMessage = {}

  new_chatroom = $scope.dispatcher.subscribe('new_chatroom')

  $scope.dispatcher.trigger 'chatroom.new_chatter', { room: 'new_chatroom' }

  $scope.dispatcher.trigger 'chatroom.get_users', { room: 'new_chatroom' }

  new_chatroom.bind 'new_user', (data) ->
    $scope.chatters.push data
    $scope.$safeApply()

  new_chatroom.bind 'user_left_room', (data) ->
    console.log data
    result = _.find $scope.chatters, (value) ->    
      data.name == value.name
    $scope.chatters.splice($scope.chatters.indexOf(result), 1) unless $scope.chatters.indexOf(result) == -1
    console.log $scope.chatters
    $scope.$safeApply()
   

  new_chatroom.bind 'messages.create', (message) ->
    $scope.messages.push message
    $scope.$safeApply()

  $scope.createMessage = ->
    $scope.dispatcher.trigger 'chatroom.messages.create', $scope.newMessage, (response) ->
      new_chatroom.trigger('messages.create', response)
      $scope.newMessage = {}

  $scope.closeConnection = ->
    $scope.dispatcher.disconnect()
   

]