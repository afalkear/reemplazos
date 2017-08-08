selectizeCallback = null
$(document).on "turbolinks:load", ->

  $(".responsible-modal").on "hide.bs.modal", (e) ->
    if selectizeCallback isnt null
      selectizeCallback()
      selectizeCallback = null
    $("#new_responsible").trigger("reset")
    $.rails.enableFormElements($("#new_responsible"))

  $("#new_responsible").on "submit", (e) ->
    e.preventDefault()
    $.ajax
      method: "POST"
      url: $(this).attr("action")
      data: $(this).serialize()
      success: (response) ->
        selectizeCallback
          value: response.id
          text: response.name
        selectizeCallback = null
        $(".responsible-modal").modal "toggle"
    return
  
  $(".selectize").selectize
    create: (input, callback) ->
      selectizeCallback = callback
      $("#responsible_name").val(input)
      $(".responsible-modal").modal()
      return
