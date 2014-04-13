registrationModule = angular.module('registrationModule', ['ng-match'])
registrationModule.controller 'registrationController', ($scope) ->
  $scope.signup = (isValid) ->
    if isValid
      form = $ '#new_user'
      url = '/users'
      $.post url, form.serialize(), null, 'json'
        .done (resp) ->
          window.location.href = '/users/sign_in'
        .fail (resp) ->
          showErrors resp

  $scope.email = $('#user_email').attr 'value'

  $scope.update = (isValid) ->
    if isValid
      form = $ '#edit_user'
      url = '/users'
      $.post url, form.serialize(), null, 'json'
        .done (resp) ->
          window.location.href = '/users/edit'
        .fail (resp) ->
          showErrors resp

  showErrors = (resp) ->
    errorList = $('.form .alert .user-error-content ul')
    errors = resp.responseJSON['errors']
    errorList.html ''
    (Object.keys errors).forEach (error) ->
      errorList.append "<li>#{error} #{errors[error]}</li>"
    $('.form .alert').show()
