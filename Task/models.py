from django.db import models
from django.contrib.auth import get_user_model
from django.utils.timezone import now

# Create your models here.
class Task(models.Model):
    name = models.CharField(max_length=40)
    description = models.TextField()
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    estimated_time = models.DateTimeField()
    teacher = models.ForeignKey('Login.Teacher', models.DO_NOTHING)
    group = models.ForeignKey('Login.Studgroup', models.DO_NOTHING)
    subject = models.ForeignKey('Subject', models.DO_NOTHING)
    creation_date = models.DateTimeField(default=now)

    class Meta:
        db_table = 'Task'

class Document(models.Model):
    path = models.CharField(max_length=100)
    user = models.ForeignKey(get_user_model(), models.DO_NOTHING)
    creation_date = models.DateTimeField(default=now)

    class Meta:
        db_table = 'Document'

class Task_doc(models.Model):
    task = models.ForeignKey('Task', models.DO_NOTHING)
    doc = models.OneToOneField('Document', models.DO_NOTHING)

    class Meta:
        db_table = 'Task_doc'

class Subject(models.Model):
    name = models.CharField(max_length=40)
    dep = models.ForeignKey('Login.Department', models.DO_NOTHING)

    class Meta:
        db_table = 'Subject'

class Teacher_Subject(models.Model):
    teacher = models.ForeignKey('Login.Teacher', models.DO_NOTHING)
    subject = models.ForeignKey('Subject', models.DO_NOTHING)

    class Meta:
        db_table = 'Teacher_Subject'