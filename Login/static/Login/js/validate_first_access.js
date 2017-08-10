var scripts = document.getElementsByTagName("script");
var current_script = scripts[scripts.length-1];
var script_object = $(current_script);

var url = script_object.attr("data-url");
var loginId = script_object.attr("data-LoginID");
var passwordId = script_object.attr("data-PasswordID");
var confirmPassId = script_object.attr("data-ConfirmPassID");

var error_message = "Пароли не совпадают!";

$("#".concat(loginId)).change(function () {
    var login_value = $(this).val();
    $.ajax({
        url: url,
        data: {
        'login_value': login_value
        },
        dataType: 'json',
        success: function (data) {
            $("#error").html(data.error_message);
        }
    });
});

$("#".concat(confirmPassId)).change(function () {
    var new_pass = $("#".concat(passwordId)).val();
    var conf_pass = $(this).val();
    if (new_pass != conf_pass) {
        $("#error").html(error_message);
    }
});