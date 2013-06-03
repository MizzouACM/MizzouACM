$ ->
  $("select#skill_name").change(-> $(this).closest("form").submit())