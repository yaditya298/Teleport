# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'keypress', '#user_number', ->
    if $(this).val().length == $(this).data('number-length')
      $('.check-btn').attr('disabled', false)
    else
      $('.check-btn').attr('disabled', true)
