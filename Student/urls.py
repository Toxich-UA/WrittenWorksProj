from django.conf.urls import url, include
from Student.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy

urlpatterns = [
    url(r'^$', view=load_profile, name='profile')
]