from django.shortcuts import render, redirect

# Create your views here.
def load_profile(request):
    return render(request, 'Teacher/login_success.html')