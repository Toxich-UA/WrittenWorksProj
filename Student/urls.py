from django.conf.urls import url, include

from Student.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy
from django.contrib.auth.decorators import login_required, permission_required

urlpatterns = [
    url(r'^$', view=load_stud_profile, name='student_profile'),
]