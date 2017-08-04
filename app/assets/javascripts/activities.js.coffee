$(document).ready ->
  $(".selectize").selectize
    create: (input, callback) ->
      console.log("averrrr"+ input)
      $.post("/responsibles.json", responsible: {name: input}
      ).fail(->
        #add action
      ).done((data) ->
        console.log("respuesta:" + data.id)
        if $('#activity_responsible_id').length > 0 
          $($('#activity_responsible_id')[0].lastChild).attr("value",data.id)
      )
      #Responsibles.create_responsible(this, input)
      callback({
        value: input,
        text: input
      })

#class @Responsibles
#  @create_responsible: (new_responsible, text) ->
#    $.post "/responsibles.json",
#      responsible:
#        value: text
#    , (data) ->
#      #if $('#activity_responsible_id').length > 0
#      #  $($('#activity_responsible_id')[0][$('#activity_responsible_id')[0].length - 1]).attr("value",data.id)
#    .fail ->
#      #add fail action
#    .done ->
#      #add donde action

