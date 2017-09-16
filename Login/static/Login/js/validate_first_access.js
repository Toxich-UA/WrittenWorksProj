$("#first-access-form").validate({
    rules: {
        fa_login:{
            required: true,
            minlength: 3
        },
        fa_password:{
            required: true,
            minlength: 5
        },
        fa_confirm_password:{
            required: true,
            equalTo: "#password"
        }
    },

    messages:{
         fa_login: {
             required: 'Поле обязательное для заполнения',
             minlength: 'Минимальная длина логина – {0} символов'
         },
        fa_password:{
            required: 'Поле обязательное для заполнения',
            minlength: 'Минимальная длина пароля – {0} символов'
        },
        fa_confirm_password:{
             required: 'Поле обязательное для заполнения',
            equalTo: 'Пароли не совпадают'
        }
    },
     errorClass: "form-invalid",
})

$("#lg_username").blur(function (){
        $.ajax({
        url: '/validate_login/',
        data: {
        'login_value': login_value
        },
        dataType: 'text',
        success: function (data) {
            if (data == "True"){
                 $("<label id=\"lg_username-error\" class=\"form-invalid\" for=\"lg_username\">Такой логин существует</label>").appendTo($(".form-group-login"));
            }

        }
    });
    })