from django.conf.urls import url, include
from Task.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy

urlpatterns = [
    url(r'^task/$', view=test_task, name='task'),
    url(r'^modal/add_task/$', view=add_task_view, name='add_task'),
]
