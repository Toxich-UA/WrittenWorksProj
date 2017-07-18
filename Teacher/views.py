from django.shortcuts import render, redirect
from WWP.decorators import wwp_login_required

# Create your views here.
@wwp_login_required
def load_teacher_profile(request):
    return render(request, 'Teacher/login_success.html')