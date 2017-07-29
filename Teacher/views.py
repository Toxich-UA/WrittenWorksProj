from django.shortcuts import render, redirect
from django.contrib.auth.decorators import permission_required

# Create your views here.
@permission_required(perm='Login.teacher_rights')
def load_teacher_profile(request):
    return render(request, 'Teacher/login_success.html')