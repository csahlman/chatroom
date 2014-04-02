angular.module('chatroom').controller 'ChatroomCtrl', ['$scope', '$http', '$timeout', '$interval', ($scope, $http, 
  $timeout, $interval) ->

  $scope.chatters = []

  $scope.$safeApply = ->
    $scope.$apply() unless $scope.$$phase

  $scope.messages = []

  $scope.newMessage = {}

  new_chatroom = $scope.dispatcher.subscribe('new_chatroom')

  $scope.dispatcher.trigger 'chatroom.new_chatter', { room: 'new_chatroom' }

  $scope.dispatcher.trigger 'chatroom.get_users', { room: 'new_chatroom' }

  new_chatroom.bind 'user_list', (data) ->
    $scope.chatters = data
    $scope.$safeApply()

  # userListFetcher = $interval ->
  #   new_chatroom.trigger 'chatroom.get_users'
  # , 5000
   

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