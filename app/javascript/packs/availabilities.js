$(document).on("turbolinks:load", function () {
    $(".time_available").select2({
        placeholder: 'Select a time',
        allowClear: true,
        multiple: true
    });
});