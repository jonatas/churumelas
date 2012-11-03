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
  $('#console').focus()
  window.seeAnswer = ->
      $('#code_challenge').fadeOut 50
      $.get '/game/see_valid_answer/'+ $('#current_level').val(),
        (result) ->
          valid_code = $('#code_challenge').text().replace('# your code here',result.valid_answer)
          Rainbow.color valid_code, '#code_challenge',(new_code) ->
            $('#code_challenge').html(new_code)
            $('#code_challenge').fadeIn 500

  setTimeout("if ($('#console').val() == ''){ seeAnswer()}",120000)
  $('#see_answer').on('click', window.seeAnswer)
