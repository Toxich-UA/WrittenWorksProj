from django.conf.urls import url, include
from Task.views import *
from django.views.generic import RedirectView
from django.core.urlresolvers import reverse_lazy

urlpatterns = [
    url(r'^modal/add_task/$', view=add_task_view, name='add_task'),
    url(r'^view_tasks/$', view=view_tasks, name='view_tasks'),
]
