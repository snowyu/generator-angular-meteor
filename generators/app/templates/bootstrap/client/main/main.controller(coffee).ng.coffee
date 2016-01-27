'use strict'

angular.module '<%= appname %>'
.controller 'MainCtrl', ($scope, $reactive, $auth) ->
  console.log $auth.getUserInfo()
<% if(pagination){ %>  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'

<% } %>
  $scope.helpers
    things: -> Things.find {}<% if(pagination){ %> , {sort:$scope.getReactively('sort')}
    thingsCount: -> Counts.get 'numberOfThings'<% } %>
  $scope.subscribe('things'<% if(pagination){ %>, -> [{
    limit: parseInt($scope.getReactively('perPage'))
    skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
    sort: $scope.getReactively('sort')
  }, $scope.getReactively('search')]<% } %>)


  $scope.save = () ->
    if $scope.form.$valid
      Things.insert $scope.newThing
      $scope.newThing = undefined

  $scope.remove = (thing) ->
    Things.remove thing._id<% if(pagination){ %>

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage

  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)<% } %>
