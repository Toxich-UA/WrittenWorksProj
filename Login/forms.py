from django import forms
from Login.property import *


# These are the form fields for Log in user
class LoginForm(forms.Form):
    title = LOGIN_TITLE
    registration_page_title = REGISTRATION_TITLE
    forget_pass_line = FORGET_PASSWORD
    remember_line = REMEMBER

    lg_username = forms.CharField(widget=forms.TextInput(attrs=
                                  {'id': 'lg_username',
                                   'class': 'form-control',
                                   'placeholder': LOGIN,
                                   'required title': DONT_LEAVE_FIELD_EMPTY,
                                   'oninvalid': "this.setCustomValidity('{}')".format(DONT_LEAVE_FIELD_EMPTY),
                                   'oninput': "setCustomValidity('')"}),
                                  required=False)

    lg_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                  {'id': 'lg_password',
                                   'class': 'form-control',
                                   'placeholder': PASSWORD,
                                   'required title': DONT_LEAVE_FIELD_EMPTY,
                                   'oninvalid': "this.setCustomValidity('{}')".format(DONT_LEAVE_FIELD_EMPTY),
                                   'oninput': "setCustomValidity('')"}),
                                  required=False)

    lg_remember = forms.BooleanField(widget=forms.CheckboxInput(attrs=
                                     {'id': 'lg_remember'}),
                                     required=False)

    def clean_username(self):
        return self.cleaned_data['lg_username']

    def clean_password(self):
        return self.cleaned_data['lg_password']

    def clean_remember_box(self):
        return self.cleaned_data['lg_remember']


class LoginWithKeyForm(forms.Form):
    title = REGISTRATION_TITLE
    login_page_title = LOGIN_TITLE

    reg_key = forms.CharField(widget=forms.TextInput(attrs=
                                                      {'id': 'reg_key',
                                                       'class': 'form-control',
                                                       'placeholder': REG_KEY,
                                                       'required title': DONT_LEAVE_FIELD_EMPTY,
                                                       'oninvalid': "this.setCustomValidity('{}')".format(DONT_LEAVE_FIELD_EMPTY),
                                                       'oninput': "setCustomValidity('')",
                                                       }), required=False)

    def cleaned_regkey(self):
        return self.cleaned_data['reg_key']


class FirstAccessForm(forms.Form):
    fa_login = forms.CharField(widget=forms.TextInput(attrs=
                                                   {'id': 'lg_username',
                                                    'class': 'form-control',
                                                    'placeholder': LOGIN,
                                                    'required title': DONT_LEAVE_FIELD_EMPTY,
                                                    'oninvalid': "this.setCustomValidity('{}')".format(
                                                        DONT_LEAVE_FIELD_EMPTY),
                                                    'oninput': "setCustomValidity('')"}),
                            required=False)

    fa_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                                          {'id': 'password',
                                                           'class': 'form-control',
                                                           'placeholder': PASSWORD,
                                                           'required title': DONT_LEAVE_FIELD_EMPTY,
                                                           'oninvalid': "this.setCustomValidity('{}')".format(
                                                               DONT_LEAVE_FIELD_EMPTY),
                                                           'oninput': "setCustomValidity('')"}),
                               required=False)

    fa_confirm_password = forms.CharField(widget=forms.PasswordInput(attrs=
                                                                  {'id': 'confirm_password',
                                                                   'class': 'form-control',
                                                                   'placeholder': CONFIRM_PASSWORD,
                                                                   'required title': DONT_LEAVE_FIELD_EMPTY,
                                                                   'oninvalid': "this.setCustomValidity('{}')".format(
                                                                       DONT_LEAVE_FIELD_EMPTY),
                                                                   'oninput': "setCustomValidity('')"}),
                                       required=False)

    def get_login(self):
        return self.cleaned_data['fa_login']

    def get_password(self):
        return self.cleaned_data['fa_password']

    def get_confirm_password(self):
        return self.cleaned_data['fa_confirm_password']
