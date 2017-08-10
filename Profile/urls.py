from django.conf.urls import url, include
from Profile.views import *

urlpatterns = [
    url(r'^student/$', view=load_stud_profile, name='student_profile'),
    url(r'^teacher/$', view=load_teacher_profile, name='teacher_profile'),
]