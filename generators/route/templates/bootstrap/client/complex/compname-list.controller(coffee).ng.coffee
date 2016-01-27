'use strict'

angular.module '<%= appname %>'
.controller '<%= compnameCapped%>ListCtrl', ($scope, currentUser) ->
<% if(pagination){ %>  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'<% } %>

  $scope.helpers
    <%= compname %>: -> <%= compnameCapped %>.find {}<% if(pagination){ %>, {sort:$scope.getReactively('sort')}
    <%= compname %>Count: -> Counts.get 'numberOf<%= compnameCapped %>'<% } %>

  $scope.subscribe('<%= compname %>'<% if(pagination){ %>, -> [{
    limit: parseInt($scope.getReactively('perPage'))
    skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
    sort: $scope.getReactively('sort')
  }, $scope.getReactively('search')]<% } %>)

  $scope.save = () ->
    if $scope.form.$valid
      <%= compnameCapped %>.insert $scope.new<%= compnameCappedSingular %>
      $scope.new<%= compnameCappedSingular %> = undefined

  $scope.remove = (<%= compnameSingular %>) ->
    <%= compnameCapped %>.remove <%= compnameSingular %><% if(pagination){ %>

  $scope.pageChanged = (newPage) ->
    $scope.page = newPage

  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)<% } %>
