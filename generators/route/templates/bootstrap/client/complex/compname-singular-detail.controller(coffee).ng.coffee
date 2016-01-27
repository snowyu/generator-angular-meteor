'use strict'

angular.module '<%= appname %>'
.controller '<%= compnameCappedSingular%>DetailCtrl', ($scope, $stateParams, currentUser) ->
  $scope.helpers
    <%= compnameSingular %>: () ->
      <%= compnameCapped %>.findOne $stateParams.<%= compnameSingular %>Id
  $scope.subscribe('<%=compname%>')

  $scope.save = () ->
    if $scope.form.$valid
      <%= compnameCapped %>.update $scope.<%= compnameSingular %>._id, $set: $scope.<%= compnameSingular %>, (err, numberOfDocs)->
        if err
          console.log 'save error', err
        else
          console.log 'save successful, docs affected ', numberOfDocs

  $scope.reset = () ->
    $scope.<%= compnameSingular %>.reset()
