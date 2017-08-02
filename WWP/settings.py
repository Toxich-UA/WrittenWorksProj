"""
Django settings for WWP project.

Generated by 'django-admin startproject' using Django 1.11.

For more information on this file, see
https://docs.djangoproject.com/en/1.11/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.11/ref/settings/
"""

import os
from .utility import read_config_file
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import errno

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.11/howto/deployment/checklist/
config = read_config_file()
DB_name = config[0]
user_name = config[1]
Password = config[2]
Host = config[3]
Port = config[4]
Secret_key = config[5]
# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = Secret_key

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []

# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.contenttypes',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'django.contrib.auth',

    'Login',
    'Student',
    'Teacher',
]

PASSWORD_HASHERS = ('django.contrib.auth.hashers.MD5PasswordHasher',)

AUTH_USER_MODEL = 'Login.User'

LOGIN_URL = '/login/'

AUTHENTICATION_BACKENDS = [
    # import custom auth backend
    'Login.backends.WWP_AuthBackend',
    'django.contrib.auth.backends.ModelBackend',
]

SESSION_ENGINE = 'Login.models'
SESSION_EXPIRE_AT_BROWSER_CLOSE = True
# time in minutes
# 60min*24hours*365days*1years
INFINITE_SESSION = 31536000
TEMP_SESSION = 86400

LOGIN_REQUIRED_URLS = [
    r'/profile/student/(.*)$',
    r'/profile/teacher/(.*)$',
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    # import custom auth middleware
    'Login.middleware.RequireLoginMiddleware',
]



ROOT_URLCONF = 'WWP.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'Login/templates')]
        ,
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'WWP.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.11/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': DB_name,
        'USER': user_name,
        'PASSWORD': Password,
        'HOST': Host,
        'PORT': Port,
    }
}


# Password validation
# https://docs.djangoproject.com/en/1.11/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.11/topics/i18n/

LANGUAGE_CODE = 'uk-UA'

TIME_ZONE = 'Europe/Kiev'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.11/howto/static-files/

STATIC_URL = '/static/'