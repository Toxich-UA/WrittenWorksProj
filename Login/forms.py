from django import forms
import hashlib

#It is a form fields for Log in user
class LoginForm(forms.Form):
    lg_username = forms.CharField(widget=forms.TextInput(attrs=
                                  {'id': 'lg_username',
                                   'class': 'form-control',
                                   'placeholder': 'Логин'},
                                                        ), required=False)

    lg_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                  {'id': 'lg_password',
                                   'class': 'form-control',
                                   'placeholder': 'Пароль'}), required=False)

    lg_remember = forms.BooleanField(widget=forms.CheckboxInput(attrs=
                                     {'id': 'lg_remember'}), required=False)

    def clean_username(self):
        return self.cleaned_data['lg_username']


    def clean_password(self):
        return hashlib.md5(self.cleaned_data['lg_password'].encode('utf8')).hexdigest()
