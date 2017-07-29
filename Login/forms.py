from django import forms

#It is a form fields for Log in user
class LoginForm(forms.Form):
    lg_username = forms.CharField(widget=forms.TextInput(attrs=
                                  {'id': 'lg_username',
                                   'class': 'form-control',
                                   'placeholder': 'Логин',
                                   'required title':'Нельзя оставить это поле пустым',}),
                                   required=False)

    lg_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                  {'id': 'lg_password',
                                   'class': 'form-control',
                                   'placeholder': 'Пароль',
                                   'required title':'Нельзя оставить это поле пустым',}), required=False)

    lg_remember = forms.BooleanField(widget=forms.CheckboxInput(attrs=
                                     {'id': 'lg_remember'}), required=False)

    def clean_username(self):
        return self.cleaned_data['lg_username']


    def clean_password(self):
        return self.cleaned_data['lg_password']

class LoginWithKeyForm(forms.Form):
    fp_email = forms.CharField(widget=forms.TextInput(attrs=
                                                      {'id': 'fp_email',
                                                       'class': 'form-control',
                                                       'placeholder': 'Ключ аутентификации',
                                                       'required title':'Нельзя оставить это поле пустым',}), required=False)

    def cleaned_regkey(self):
        return self.cleaned_data['fp_email']
