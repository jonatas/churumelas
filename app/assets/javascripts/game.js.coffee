# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $('#console').focus()
  window.console.started_typing = false
  window.original_code = $('#code_challenge').text()
  $('#console').keyup ->
    input_value = $('#console').val()
    updateCodeChallenge(input_value)
    if input_value.length > 0 and not window.console.started_typing
       $.post '/game/start_typing', {now: new Date()},
         ->
           window.console.started_typing = true
         , 'json'

  updateCodeChallenge = (with_code) ->
    valid_code = window.original_code.replace(/# (your code here|seu codigo aqui)/,with_code)
    Rainbow.color valid_code, '#code_challenge',(new_code) ->
      $('#code_challenge').html(new_code)

  seeAnswer = ->
      $.get '/game/see_valid_answer/'+ $('#current_level').val(),
        (result) ->
          updateCodeChallenge result.valid_answer

  setTimeout("if ($('#console').val() == ''){ seeAnswer()}",120000)
  $('#see_answer').on('click', seeAnswer)
  #$('.tooltip').each (tip) ->
    #console.log tip
    #$(tip).qtip content: $(tip).attr('tooltip'), style: 'dark'
