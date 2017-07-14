from django.shortcuts import render
from .models import *
from .forms import LoginForm

# Create your views here.

def login(request):
    form = LoginForm()
    context = {
        'loginform': form,
    }
    return render(request, 'Login/index.html', context)

def registration(request):
    return render(request, 'Login/registration.html')