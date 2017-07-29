from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import Permission
from .utility import get_client_ip, PROFILE_URL_PATTERN as url_pattern
from .models import User
from .forms import LoginForm, LoginWithKeyForm
from django.conf import settings

# Create your views here.
# Simple login view processing
def login_view(request):
    login_failed_template = 'Login/failed_login.html'
    login_template = 'Login/index.html'
    if request.method == 'POST':
        #creating form
        form = LoginForm(request.POST)
        context = {
            'loginform': form,
        }

        #form validation
        if form.is_valid():
            login_field = form.clean_username()
            password = form.clean_password()
            remember = form.cleaned_data['lg_remember']
            #verifying does user exist or password is correct
            user = authenticate(request=request, username=login_field, password=password)
            if not user:
                return render(request, login_failed_template, context)
            else:
                login(request, user)
                role = User.define_user_role(user.pk)
                if role:
                    # remember role and userIP in session
                    request.session['role'] = role
                    request.session['_auth_ip'] = get_client_ip(request)
                    if remember:
                        request.session.set_expiry(settings.INFINITE_SESSION)
                    # checking permissions
                    perm = user.has_perm('Login.{}_rights'.format(role))
                    if not perm:
                        permission = Permission.objects.get(codename='{}_rights'.format(role))
                        user.user_permissions.add(permission)
                    # redirect to profile
                    return redirect(url_pattern.format(role))
                else:
                    return render(request, login_failed_template, context)
    else:
        if request.user.is_authenticated and 'role' in request.session.keys():
            role = request.session['role']
            return redirect(url_pattern.format(role))

        form = LoginForm()
        context = {
            'loginform': form,
        }
        return render(request, login_template, context)

# Logout user
def logout_view(request):
    logout(request)
    return redirect(settings.LOGIN_URL)

# Log user in using regkey
def registration(request):
    login_key_template = 'Login/registration.html'
    login_key_failed_template = 'Login/failed_key.html'
    if request.method == 'POST':
        #creating form
        form = LoginWithKeyForm(request.POST)
        context = {
            'loginkeyform': form,
        }

        #form validation
        if form.is_valid():
            password = form.cleaned_regkey()
            #verifying does user exist or password is correct
            user = authenticate(request=request, password=password)
            if not user:
                return render(request, login_key_failed_template, context)
            else:
                login(request, user)
                role = User.define_user_role(user.pk)
                if role:
                    request.session['role'] = role
                    request.session['_auth_ip'] = get_client_ip(request)
                    # if remember:
                    #     request.session.set_expiry(settings.INFINITE_SESSION)
                    perm = user.has_perm('Login.{}_rights'.format(role))
                    if not perm:
                        permission = Permission.objects.get(codename='{}_rights'.format(role))
                        user.user_permissions.add(permission)
                    # redirect to profile
                    return redirect(url_pattern.format(role))
                else:
                    return render(request, login_key_failed_template, context)
    else:
        if request.user.is_authenticated and 'role' in request.session.keys():
            role = request.session['role']
            return redirect(url_pattern.format(role))

        form = LoginWithKeyForm()
        context = {
            'loginkeyform': form,
        }
        return render(request, login_key_template, context)