'use strict'

angular.module('<%= appname %>')
.controller('<%= compnameCapped%>ListCtrl', function($scope, currentUser) {
<% if(pagination){ %>  $scope.page = 1
  $scope.perPage = 3
  $scope.sort = {name_sort : 1};
  $scope.orderProperty = '1'<% } %>

  $scope.helpers({
    <%= compname %>: function(){ <%= compnameCapped %>.find({}<% if(pagination){ %>, {sort:$scope.getReactively('sort')}<% } %>)}
    <% if(pagination){ %>, <%= compname %>Count: function(){ Counts.get('numberOf<%= compnameCapped %>')}<% } %>
  })
  $scope.subscribe('<%= compname %>'<% if(pagination){ %>, -> [{
    limit: parseInt($scope.getReactively('perPage')),
    skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage')),
    sort: $scope.getReactively('sort')
  }, $scope.getReactively('search')]<% } %>)

  $scope.save = function() {
    if($scope.form.$valid) {
      $scope.<%= compname %>.save($scope.new<%= compnameCappedSingular %>);
      $scope.new<%= compnameCappedSingular %> = undefined;
    }
  };

  $scope.remove = function(<%= compnameSingular %>) {
    $scope.<%= compname %>.remove(<%= compnameSingular %>);
  };<% if(pagination){ %>

  $scope.pageChanged = function(newPage) {
    $scope.page = newPage;
  };

  $scope.$watch('orderProperty', function() {
    if($scope.orderProperty) {
      $scope.sort = {name_sort: parseInt($scope.orderProperty)};
    }
  });<% } %>
});
