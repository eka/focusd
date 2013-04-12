jQuery ($) ->
  $(".row.task button, .row.task a, #delete_context").tooltip()
  $('.dropdown-toggle').dropdown()
  $('.dropdown-menu').find('form').click (e) ->
    e.stopPropagation()
