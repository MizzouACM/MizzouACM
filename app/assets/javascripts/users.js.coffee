$ ->
  $("[rel=tooltip]").tooltip()
  $("#skill_name, #skill_").change(-> $(this).closest("form").submit())
  $(".skill-filter").click ->
    $(this).remove()
    $("#skill_").closest("form").submit()
  hidden_pictures = ->
    $(this).next().html()
  $('.more-skills').popover { content: hidden_pictures, html: true, placement: 'bottom', trigger: 'hover'}
  $('.skill').tooltip {placement: 'bottom'}