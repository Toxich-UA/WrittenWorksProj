from django import  forms

#It is a form fields for Log in user
class LoginForm(forms.Form):
    lg_username = forms.CharField(widget=forms.TextInput(attrs=
                                  {'id': 'lg_username',
                                   'class': 'form-control',
                                   'placeholder': 'Логин'},
                                                        ))

    lg_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                  {'id': 'lg_password',
                                   'class': 'form-control',
                                   'placeholder': 'Пароль'}))

    lg_remember = forms.BooleanField(widget=forms.CheckboxInput(attrs=
                                     {'id': 'lg_remember'}))