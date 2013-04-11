jQuery ($) ->
  $(".row.task button, .row.task a ").tooltip()
  $('.dropdown-toggle').dropdown()
  $('.dropdown-menu').find('form').click (e) ->
    e.stopPropagation()
