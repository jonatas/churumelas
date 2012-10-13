# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  window.console.started_typing = false
  $('#console').keyup ->
    input_value = $('#console').val()
    if input_value.length > 0 and not window.console.started_typing
       $.post '/game/start_typing', {now: new Date()}, 
         ->
           window.console.started_typing = true
         , 'json'

