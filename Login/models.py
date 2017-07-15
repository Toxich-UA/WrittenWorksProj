# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals
from django.db import models
from django.db import connections
from django.db.utils import OperationalError

#Department database model
class Department(models.Model):
    dep_name = models.CharField(max_length=100)
    fac = models.ForeignKey('Faculty', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'Department'

#Faculty database model
class Faculty(models.Model):
    fac_name = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'Faculty'

#User database model
class User(models.Model):
    login = models.CharField(max_length=50)
    pass_field = models.CharField(db_column='pass', max_length=50)  # Field renamed because it was a Python reserved word.
    regkey = models.CharField(max_length=100)
    email = models.CharField(max_length=70, blank=True, null=True)
    last_name = models.CharField(max_length=50)
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50)

    def __str__(self):
        return str('{} {}'.format(self.pk, self.last_name))
    class Meta:
        managed = False
        db_table = 'User'

    #searching user in database
    @staticmethod
    def find_user(login):
        try:
            user = User.objects.get(login=login)
            return [user.pk, user.pass_field]
        except (User.DoesNotExist, OperationalError):
            return None

    #searching student
    @staticmethod
    def is_student(id):
        try:
            Student.objects.get(user_id=id)
            return True
        except (Student.DoesNotExist, OperationalError):
            return False

    #searching teacher
    @staticmethod
    def is_teacher(id):
        try:
            Teacher.objects.get(user_id=id)
            return True
        except (Teacher.DoesNotExist, OperationalError):
            return False

    #try to define user role
    @staticmethod
    def define_user_role(id):
        if User.is_student(id):
            return 'student'
        elif User.is_teacher(id):
            return 'teacher'
        else:
            return None




#Studgroup database model
class Studgroup(models.Model):
    group_name = models.CharField(max_length=10)
    dep = models.ForeignKey(Department, models.DO_NOTHING)

    def __str__(self):
        return self.group_name
    class Meta:
        managed = False
        db_table = 'StudGroup'

#Student database model
class Student(models.Model):
    user = models.ForeignKey('User', models.DO_NOTHING, unique=True)
    group = models.ForeignKey(Studgroup, models.DO_NOTHING)

    def __str__(self):
        return str('{} {}'.format(self.user, Studgroup(self.group).group_name))
    class Meta:
        managed = False
        db_table = 'Student'

#Teacher database model
class Teacher(models.Model):
    user = models.ForeignKey('User', models.DO_NOTHING, unique=True)

    class Meta:
        managed = False
        db_table = 'Teacher'








