// getting current script
var scripts = document.getElementsByTagName("script");
var current_script = scripts[scripts.length-1];
var script_object = $(current_script);

// receiving data params
var url = script_object.attr("data-url");
var loginId = script_object.attr("data-LoginID");
var passwordId = script_object.attr("data-PasswordID");
var confirmPassId = script_object.attr("data-ConfirmPassID");

var login_is_free_msg = "<p class=\"text-success\"><span class=\"glyphicon glyphicon-ok-sign\"></span>Логин свободен</p>";
var login_is_taken_msg = "<p class=\"text-danger\"><span class=\"glyphicon glyphicon-exclamation-sign\"></span>Логин занят</p>";
var success_confirm_msg = "<p class=\"text-success\"><span class=\"glyphicon glyphicon-ok-sign\"></span>Пароли совпадают</p>";
var error_confirm_msg = "<p class=\"text-danger\"><span class=\"glyphicon glyphicon-exclamation-sign\"></span>Пароли не совпадают</p>";

// login validation function
$("#".concat(loginId)).change(function () {
    var login_value = $(this).val();
    $.ajax({
        url: url,
        data: {
        'login_value': login_value
        },
        dataType: 'json',
        success: function (data) {
            if(data.message == true) {
                $("#login-message").html(login_is_free_msg);
            }
            else{
                $("#login-message").html(login_is_taken_msg);
            }
        }
    });
});

// checking password confirmation
$("#".concat(confirmPassId)).bind('input', function () {
    var new_pass = $("#".concat(passwordId)).val();
    var conf_pass = $(this).val();
    if (new_pass != conf_pass) {
        $("#confirm-pass-message").html(error_confirm_msg);
    }
    else if(new_pass == conf_pass){
        $("#confirm-pass-message").html(success_confirm_msg);
    }
});