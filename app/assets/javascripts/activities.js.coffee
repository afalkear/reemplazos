ready = ->

  $(".add-hour-button").on "click", (e) ->
    e.preventDefault()
    $(".add-hour-form").show()

  $(".hour-form").on "submit", (e) ->
    console.log("helloooo: #{$( ".hour-form select option:selected" ).text()}")
    e.preventDefault()
    e.stopImmediatePropagation()
    $(".rendered_hours").text($(".rendered_hours").text() + ", " + $( ".hour-form select option:selected" ).text())
    return false

$(document).ready(ready)
$(document).on('turbolinks:load', ready)
