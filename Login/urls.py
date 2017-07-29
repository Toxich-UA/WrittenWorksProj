from django.conf.urls import url, include
from Login.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy

urlpatterns = [
    url(r'^$', RedirectView.as_view(url=reverse_lazy('login'), permanent=False)),
    url(r'^login/$', view=login_view, name='login'),
    url(r'^registration/$', view=registration, name='registration'),
    url(r'^logout', view=logout_view, name='logout')
]
