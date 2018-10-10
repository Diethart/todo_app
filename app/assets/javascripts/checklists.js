$(document).ready(function() {
  $("#checklist_checklist_template").select2({
    placeholder: "Choose checklist template"
  });
});

$(document).ready(function() {
  $('input#item_result_done').each(function() {
    $(this).on('change', function() {
      $(this).closest('form').submit();
    });
  });
});
