angular.module('chatroom', ['ngRoute', 'ngAnimate', 'ui.bootstrap'])

angular.module('chatroom').config ['$httpProvider', ($httpProvider) ->
  $httpProvider.defaults.transformRequest.push (data, headersGetter) ->
    utf8_data = data
    unless angular.isUndefined(data)
      d = angular.fromJson(data)
      d["_utf8"] = "☃"
      utf8_data = angular.toJson(d)
    utf8_data
]

angular.module('chatroom').config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when('/',
    controller: 'ChatroomCtrl'
    templateUrl: "/assets/pages/chatroom.tpl.html"
  )
]
