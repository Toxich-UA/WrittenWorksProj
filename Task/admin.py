from django.contrib import admin
from .models import *

# Register your models here.
admin.site.register(Task)
admin.site.register(Document)
admin.site.register(Task_doc)
admin.site.register(Subject)
admin.site.register(Teacher_Subject)