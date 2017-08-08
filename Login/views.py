from django.contrib import messages
from django.contrib.auth.hashers import make_password
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Permission
from django.http import JsonResponse

from Login.property import FAIL_DATA_UPDATE, SUCCESS_DATA_UPDATE, PASSWORD_CONFIRMATION_FAIL, LOGIN_IS_TAKEN, \
    LOGIN_IS_FREE, WRONG_USERNAME_OR_PASSWORD, WRONG_REG_KEY
from .utility import get_client_ip, PROFILE_URL_PATTERN, LOGIN_TEMPLATE, ERROR_TEMPLATE, \
    REGISTRATION_TEMPLATE, FIRST_ACCESS_TEMPLATE
from .models import User
from .forms import LoginForm, LoginWithKeyForm, FirstAccessForm
from django.conf import settings


# Create your views here.
# Simple login view processing
def login_view(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        context = {'loginform': form}

        if form.is_valid():
            login_field = form.clean_username()
            password = form.clean_password()
            remember = form.clean_remember_box()

            # verifying does user exist and password is correct
            user = authenticate(request=request, username=login_field, password=password)
            if not user:
                message = {'tag': messages.ERROR,
                            'text': WRONG_USERNAME_OR_PASSWORD}
                return _render_form_error_template(request, LOGIN_TEMPLATE, message, context)
            return _login_found_user(request, user, remember)

        else:
            return render(request, ERROR_TEMPLATE, status=400)

    elif request.method == 'GET':
        return _process_get({'loginform': LoginForm()}, request, LOGIN_TEMPLATE)
    else:
        return render(request, ERROR_TEMPLATE, status=400)


# Logout user
def logout_view(request):
    logout(request)
    return redirect(settings.LOGIN_URL)


# Log user in using regkey
def registration(request):
    if request.method == 'POST':
        form = LoginWithKeyForm(request.POST)
        context = {'loginkeyform': form}

        if form.is_valid():
            # find user by authentication key
            user = authenticate(request=request, password=form.cleaned_regkey())
            if not user:
                message = {'tag': messages.ERROR,
                           'text': WRONG_REG_KEY}
                return _render_form_error_template(request, REGISTRATION_TEMPLATE, message, context)
            return _login_found_user(request, user, False)
        else:
            return render(request, ERROR_TEMPLATE, status=400)

    elif request.method == 'GET':
        return _process_get({'loginkeyform': LoginWithKeyForm()}, request, REGISTRATION_TEMPLATE)
    else:
        return render(request, ERROR_TEMPLATE, status=400)

def first_access(request):
    if request.method == 'GET':
        if not request.user.has_reg_key:
            return redirect(PROFILE_URL_PATTERN.format(request.session['role']))
        user = request.user
        first_access_form = FirstAccessForm()
        context = {
            'user': user,
            'first_access_form': first_access_form,
        }
        return render(request, FIRST_ACCESS_TEMPLATE, context)
    elif request.method == 'POST':
        form = FirstAccessForm(request.POST)
        context = {
            'user': request.user,
            'first_access_form': form,
        }

        message = {
            'text': SUCCESS_DATA_UPDATE,
            'tag': messages.SUCCESS
        }

        if form.is_valid():

            user = request.user
            new_login = form.get_login()
            #request.session['new_login'] = new_login
            new_password = form.get_password()
            password_confirmation = form.get_confirm_password()

            if new_password != password_confirmation:
                message['text'] = PASSWORD_CONFIRMATION_FAIL
                message['tag'] = messages.ERROR
                return _render_form_error_template(request, FIRST_ACCESS_TEMPLATE, message, context)

            update_success = user.update_login_credentials(new_login, make_password(new_password))
            if not update_success:
                message['text'] = LOGIN_IS_TAKEN
                message['tag'] = messages.ERROR
                return _render_form_error_template(request, FIRST_ACCESS_TEMPLATE, message, context)
            logout(request)

            # verifying does user exist and password is correct
            user = authenticate(request=request, username=new_login, password=new_password)
            if not user:
                message['text'] = FAIL_DATA_UPDATE
                message['tag'] = messages.ERROR
                return _render_form_error_template(request, FIRST_ACCESS_TEMPLATE, message, context)

            # after the first access user's reg. key must be deleted
            user.destroy_registration_key()
            return _login_found_user(request, user, False,
                                     context)

        else:
            return render(request, ERROR_TEMPLATE, status=400)

    else:
        return render(request, ERROR_TEMPLATE, status=400)

def validate_login(request):
    login_value = request.GET.get('login_value')
    if request.user.login != login_value:
        is_taken = User.objects.filter(login=login_value).exists()
    else:
        is_taken = False

    data = {}
    if is_taken:
        data['error_message'] = LOGIN_IS_TAKEN
    else:
        data['error_message'] = LOGIN_IS_FREE
    return JsonResponse(data)

def _render_form_error_template(request, template, message, context):
    if message:
        messages.add_message(request, message['tag'], message['text'])
        return render(request, template, context)

def _login_found_user(request, user, remember, message=None):
    role = User.define_user_role(user.pk)
    if not role:
        return render(request, ERROR_TEMPLATE, status=500)  # this case is exceptional, required data must exist

    login(request, user)
    request.session['role'] = role
    request.session['_auth_ip'] = get_client_ip(request)
    if remember:
        request.session.set_expiry(settings.INFINITE_SESSION)
    else:
        request.session.set_expiry(settings.TEMP_SESSION)
    # checking permissions
    if not user.has_perm('Login.{}_rights'.format(role)):
        permission = Permission.objects.get(codename='{}_rights'.format(role))
        user.user_permissions.add(permission)
    # redirect to profile
    return redirect(PROFILE_URL_PATTERN.format(role))

def _process_get(context, request, success_template):
    if request.user.is_authenticated and 'role' in request.session.keys():
        role = request.session['role']
        return redirect(PROFILE_URL_PATTERN.format(role))
    return render(request, success_template, context)