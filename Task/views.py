from django.shortcuts import render

# Create your views here.
def test_task(request):
    context = {
        'darova': 260,
    }
    return render(request, 'Task/task_test.html', context)