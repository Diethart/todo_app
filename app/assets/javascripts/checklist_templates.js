$(document).ready(function() {
  $("#checklist_template_items").select2({
    placeholder: "Choose items"
  });

  $("#checklist_template_items").on("select2:select", function (evt) {
    var element = evt.params.data.element;
    var $element = $(element);

    $element.detach();
    $(this).append($element);
    $(this).trigger("change");
  });
});
