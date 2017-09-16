from django.shortcuts import render
from django.http import JsonResponse
from django.template import loader
from .models import *
from Login.models import Student, Teacher

# Create your views here.
def add_task_view(request):
    task_template = loader.render_to_string(
        'Task/add_task.html'
    )
    output_data = {
    'task_template': task_template,
    }
    return JsonResponse(output_data)

def view_tasks(request):
    role = request.session['role']
    if role == 'student':
        stud_group = Student.objects.get(user = request.user).group
        tasks_data = Task.objects.filter(group = stud_group)
    elif role == 'teacher':
        teacher = Teacher.objects.get(user = request.user)
        tasks_data = Task.objects.filter(teacher = teacher)
    context = {
        'role': role,
        'tasks_data': tasks_data
    }
    return render(request, 'Task/view_tasks.html', context)


