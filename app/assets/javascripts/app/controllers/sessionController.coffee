sessionModule = angular.module('sessionModule', [])
sessionModule.controller 'sessionController', ($scope) ->
  $scope.login = (isValid) ->
    if isValid
      form = $ '#new_user'
      url = '/users/sign_in'
      $.post url, form.serialize(), null, 'json'
        .done (resp) ->
          window.location.href = '/inside'
        .fail (resp) ->
          $('.form .alert .user-error-content').html resp.responseJSON['error']
          $('.form .alert').show()
