# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals
from django.db import models, IntegrityError
from django.db.utils import OperationalError
from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.sessions.backends.db import SessionStore as DBStore
from django.contrib.sessions.base_session import AbstractBaseSession
from django.utils.timezone import now
from .managers import UserManager

#Department database model
class Department(models.Model):
    dep_name = models.CharField(max_length=100)
    fac = models.ForeignKey('Faculty', models.DO_NOTHING)

    class Meta:
        db_table = 'Department'

#Faculty database model
class Faculty(models.Model):
    fac_name = models.CharField(max_length=100)

    class Meta:
        db_table = 'Faculty'

#User database model
class User(AbstractBaseUser, PermissionsMixin):
    login = models.CharField(max_length=50, unique=True)
    regkey = models.CharField(max_length=100, null=True)
    email = models.CharField(max_length=100, blank=True, null=True)
    last_name = models.CharField(max_length=50)
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50)
    is_active = models.BooleanField('active', default=True)
    is_staff = models.BooleanField(default=False)

    objects = UserManager()

    USERNAME_FIELD = 'login'
    REQUIRED_FIELDS = []

    def __str__(self):
        return str('{} {} {} {}'.format(self.pk, self.last_name, self.login, self.password))

    class Meta:
        verbose_name = 'user'
        verbose_name_plural = 'users'


    def get_full_name(self):
        '''
        Returns the first_name plus the last_name, with a space in between.
        '''
        full_name = '%s %s' % (self.first_name, self.last_name)
        return full_name.strip()

    def get_short_name(self):
        '''
        Returns the short name for the user.
        '''
        return self.login

    def update_login_credentials(self, login, password):
        user = User.objects.get(id=self.pk)
        user.login = login
        user.password = password
        try:
            user.save()
        except IntegrityError:
            return False
        return True

    def destroy_registration_key(self):
        user = User.objects.get(id=self.pk)
        user.regkey = None
        user.save()

    @property
    def has_reg_key(self):
        return self.regkey is not None

    #searching student
    @staticmethod
    def is_student(id):
        try:
            Student.objects.get(user_id=id)
            return True
        except (Student.DoesNotExist, OperationalError, ValueError):
            return False

    #searching teacher
    @staticmethod
    def is_teacher(id):
        try:
            Teacher.objects.get(user_id=id)
            return True
        except (Teacher.DoesNotExist, OperationalError, ValueError):
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

    def get_user_profile_info(self, role):
        if role == 'student':
            try:
                stud_info = Student.objects.get(user=self)
                stud_dict = {'last_name': self.last_name,
                             'first_name': self.first_name,
                             'middle_name': self.middle_name,
                             'group': stud_info.group.group_name,
                             'dept': stud_info.group.dep.dep_name,
                             'fac': stud_info.group.dep.fac.fac_name
                             }
                return stud_dict
            except self.DoesNotExist:
                return None
        elif role == 'teacher':
            try:
                stud_dict = {'last_name': self.last_name,
                             'first_name': self.first_name,
                             'middle_name': self.middle_name}
                return stud_dict
            except self.DoesNotExist:
                return None

#Studgroup database model
class Studgroup(models.Model):
    group_name = models.CharField(max_length=10)
    dep = models.ForeignKey('Department', models.DO_NOTHING)

    def __str__(self):
        return self.group_name
    class Meta:
        db_table = 'StudGroup'

#Student database model
class Student(models.Model):
    user = models.OneToOneField(User, models.DO_NOTHING)
    group = models.ForeignKey(Studgroup, models.DO_NOTHING)

    def __str__(self):
        return str('{} {}'.format(self.user, Studgroup(self.group).group_name))
    class Meta:
        db_table = 'Student'

#Teacher database model
class Teacher(models.Model):
    user = models.OneToOneField(User, models.DO_NOTHING)

    class Meta:
        db_table = 'Teacher'

#custom session engine
class WWP_session(AbstractBaseSession):
    user = models.ForeignKey(User, models.CASCADE)
    ip_addr = models.CharField(max_length=20, null=True)
    login_date = models.DateTimeField(default=now)

    class Meta:
        app_label = 'Login'

    @classmethod
    def get_session_store_class(cls):
        return SessionStore

class SessionStore(DBStore):
    @classmethod
    def get_model_class(cls):
        return WWP_session

    def create_model_instance(self, data):

        obj = super(SessionStore, self).create_model_instance(data)
        try:
            user_id = int(data.get('_auth_user_id'))
            user_ip = str(data.get('_auth_ip'))
        except (ValueError, TypeError):
            user_id = None
            user_ip = None
        obj.user_id = user_id
        obj.ip_addr = user_ip
        return obj

#auxiliary model for permissions
class UsersRightsSupport(models.Model):
    class Meta:
        managed = False
        permissions = (
            ('student_rights','Global student rights'),
            ('teacher_rights','Global teacher rights')
        )




