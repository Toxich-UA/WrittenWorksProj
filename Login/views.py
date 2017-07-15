from django.shortcuts import render, redirect, get_object_or_404
from .models import *
from .forms import LoginForm

# Create your views here.

def login(request):
    if request.method == 'POST':
        #creating form
        form = LoginForm(request.POST)
        context = {
            'loginform': form,
        }

        #form validation
        if form.is_valid():
            login = form.clean_username()

            #verifying does user exist
            userdata = User.find_user(login)
            if not userdata:
                return render(request, 'Login/failed_login.html', context)
            else:
                #verifying user password
                password = form.clean_password()

                #processing successful result
                if userdata[1] == password:
                    #defining student or teacher
                    role = User.define_user_role(userdata[0])
                    #redirect to profile
                    if role:
                        return redirect('/profile/{}/'.format(role))
                else:
                    return render(request, 'Login/failed_login.html', context)
    else:
        form = LoginForm()
        context = {
            'loginform': form,
        }
        return render(request, 'Login/index.html', context)

def registration(request):
    return render(request, 'Login/registration.html')