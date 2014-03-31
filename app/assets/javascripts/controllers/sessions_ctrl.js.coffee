angular.module('chatroom').controller 'ModalSignInCtrl', ['$scope', '$modalInstance', '$http', 'currentUser', ($scope, $modalInstance, $http, currentUser) ->
  $scope.userInfo = {}
  $scope.login = true
  $scope.newUser = {}
  $scope.currentUser = currentUser

  $scope.signIn = ->
    $http
      url: '/api/sign_in'
      method: 'POST'
      data: 
        session: $scope.userInfo
    .success (data) ->
      $scope.userInfo = {}
      $scope.currentUser = data
      $modalInstance.close($scope.currentUser)

  $scope.signUp = ->
    $http
      url: '/api/users'
      method: 'POST'
      data: 
        user: $scope.newUser
    .success (data) ->
      $scope.newUser = {}
      $scope.currentUser = data
      $modalInstance.close($scope.currentUser)

  $scope.cancel = ->
    $modalInstance.dismiss 'cancel'
]

angular.module('chatroom').controller 'SessionsCtrl', ['$scope', '$http', '$modal', ($scope, $http, $modal) ->


  $scope.openSignInModal = ->
    modalInstance = $modal.open(
      templateUrl: '/assets/directives/signin_modal.tpl.html'
      controller: 'ModalSignInCtrl'
      resolve: 
        currentUser: ->
          $scope.currentUser
    )

    modalInstance.result.then (currentUser) ->
      # set app controller currentUser
      $scope.$parent.currentUser = currentUser

  $scope.signOut = ->
    $http
      url: '/api/sign_out'
      method: "DELETE"
    .success (data) ->
      $scope.currentUser = null

]