$ ->
  $("[rel=tooltip]").tooltip()
  $("#skill_name, #skill_").change(-> $(this).closest("form").submit())
  $(".skill-filter").click ->
    $(this).remove()
    $("#skill_").closest("form").submit()