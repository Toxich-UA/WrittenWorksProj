from django.http import Http404
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import permission_required
from user_agents import parse

# Create your views here.
@permission_required(perm='Login.teacher_rights')
def load_teacher_profile(request):
    user_agent = parse(request.META['HTTP_USER_AGENT'])

    context = request.user.get_user_profile_info(request.session['role'])
    if context:
        context['agent'] = '{} {}'.format(user_agent.browser.family, user_agent.browser.version_string)
    else:
        raise Http404("Page does not exist!")
    return render(request, 'Teacher/login_success.html', context)