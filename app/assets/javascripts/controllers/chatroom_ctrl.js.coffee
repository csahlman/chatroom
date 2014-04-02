angular.module('chatroom').controller 'ChatroomCtrl', ['$scope', '$http', '$timeout', '$interval', ($scope, $http, 
  $timeout, $interval) ->

  $scope.chatters = []

  $scope.$safeApply = ->
    $scope.$apply() unless $scope.$$phase

  $scope.messages = []

  $scope.newMessage = {}

  new_chatroom = $scope.dispatcher.subscribe('new_chatroom')


  new_chatroom.bind 'user_list', (data) ->
    $scope.chatters = data
    $scope.$safeApply()
    
  $scope.dispatcher.trigger 'chatroom.get_users'


  new_chatroom.bind 'subscriber_join', (data) ->
    if data.id?
      $scope.chatters.push { name: data.name, created_at: data.created_at }
    else
      $scope.chatters.push { name: 'Guest' }
    
  new_chatroom.bind 'subscriber_part', (data) ->
    if data.id?
      result = _.find $scope.chatters, (val) ->
        val.name == data.name
      $scope.chatters.splice($scope.chatters.indexOf(result), 1)
    else
      result = _.find $scope.chatters, (val) ->
        val.name == 'Guest'
      $scope.chatters.splice($scope.chatters.indexOf(result), 1)
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