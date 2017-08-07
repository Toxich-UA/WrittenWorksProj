from django.contrib import messages
from django.contrib.auth.hashers import make_password
from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Permission

from Login.property import FAIL_DATA_UPDATE, SUCCESS_DATA_UPDATE, PASSWORD_CONFIRMATION_FAIL
from .utility import get_client_ip, PROFILE_URL_PATTERN, LOGIN_TEMPLATE, LOGIN_FAILED_TEMPLATE, ERROR_TEMPLATE, \
    REGISTRATION_FAILED_TEMPLATE, REGISTRATION_TEMPLATE
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
                return render(request, LOGIN_FAILED_TEMPLATE, context)
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
                return render(request, REGISTRATION_FAILED_TEMPLATE, context)
            return _login_found_user(request, user, False)
        else:
            return render(request, ERROR_TEMPLATE, status=400)

    elif request.method == 'GET':
        return _process_get({'loginkeyform': LoginWithKeyForm()}, request, REGISTRATION_TEMPLATE)
    else:
        return render(request, ERROR_TEMPLATE, status=400)


def first_access(request):
    if request.method == 'POST':
        form = FirstAccessForm(request.POST)

        if form.is_valid():

            user = request.user
            new_login = form.get_login()
            new_password = form.get_password()
            password_confirmation = form.get_confirm_password()

            if new_password != password_confirmation:
                return _redirect_to_profile(request,
                                            {'text': PASSWORD_CONFIRMATION_FAIL, 'tag': messages.ERROR},
                                            request.session['role'])

            user.update_login_credentials(new_login, make_password(new_password))
            logout(request)

            # verifying does user exist and password is correct
            user = authenticate(request=request, username=new_login, password=new_password)
            if not user:
                return _redirect_to_profile(request,
                                            {'text': FAIL_DATA_UPDATE, 'tag': messages.ERROR},
                                            request.session['role'])

            # after the first access user's reg. key must be deleted
            user.destroy_registration_key()

            return _login_found_user(request, user, False,
                                     {'text': SUCCESS_DATA_UPDATE, 'tag': messages.SUCCESS})

        else:
            return render(request, ERROR_TEMPLATE, status=400)

    else:
        return render(request, ERROR_TEMPLATE, status=400)


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
    return _redirect_to_profile(request, message, role)


def _redirect_to_profile(request, message, user_role):
    if message:
        messages.add_message(request, message['tag'], message['text'])
    return redirect(PROFILE_URL_PATTERN.format(user_role))


def _process_get(context, request, success_template):
    if request.user.is_authenticated and 'role' in request.session.keys():
        role = request.session['role']
        return redirect(PROFILE_URL_PATTERN.format(role))
    return render(request, success_template, context)
