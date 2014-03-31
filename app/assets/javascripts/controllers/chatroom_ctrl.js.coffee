angular.module('chatroom').controller 'ChatroomCtrl', ['$scope', '$http', '$timeout', ($scope, $http, 
  $timeout) ->

  $scope.message = {}

  $scope.createMessage = ->
    $scope.dispatcher.trigger('chatroom.messages.create', $scope.message, ->
      console.log 'success'
    )
]