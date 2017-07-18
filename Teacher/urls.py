from django.conf.urls import url, include
from Teacher.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy

urlpatterns = [
    url(r'^$', view=load_teacher_profile, name='teacher_profile')
]