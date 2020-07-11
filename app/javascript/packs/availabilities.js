$(document).on("turbolinks:load", function () {
    console.log("passing")
    $(".time_available").select2({
        placeholder: 'Select a time',
        allowClear: true,
        multiple: true
    });
});