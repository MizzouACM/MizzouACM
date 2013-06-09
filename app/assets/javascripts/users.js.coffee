$ ->
  $("#skill_name, #skill").change(-> $(this).closest("form").submit())