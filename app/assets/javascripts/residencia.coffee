# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
 ready = ->
   $('#create_setor').on 'click', (event) ->
    result = prompt("Informe o nome do setor", "")
    if result.trim() != ""
      $.post '/setores',
        nome: result
        (data) -> 
          $('<option>').attr("selected", "true").val(data.id).text(data.nome).appendTo('#residencia_setor_id');
          
    event.preventDefault()

 $(document).ready(ready)
 $(document).on('page:load', ready)