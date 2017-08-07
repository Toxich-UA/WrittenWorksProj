from django.contrib.auth.decorators import permission_required
from django.shortcuts import render, redirect

#installed using pip install user_agents
from user_agents import parse

# Create your views here.
from Login.forms import FirstAccessForm


@permission_required(perm='Login.student_rights')
def load_stud_profile(request):
    #request.session['new'] = True
    user_agent = parse(request.META['HTTP_USER_AGENT'])
    user = request.user
    context = {
        'agent': '{} {}'.format(user_agent.browser.family, user_agent.browser.version_string),
        'user': user,
        'has_reg_key': user.regkey != "deleted",
        'first_access_form': FirstAccessForm()
    }
    return render(request, 'Student/login_success.html', context)