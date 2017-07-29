import os
from django.conf import settings
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import redirect
from re import compile
from django.contrib.auth import get_user_model
from django.db.utils import OperationalError
from Login.utility import get_client_ip

DEFAULTCONFIG = ["NAME 		: \n",
                 "USERNAME 	: \n",
                 "PASSWORD	: \n",
                 "HOST		: \n",
                 "PORT		: \n",
                 "SECRET_KEY: \n"]


def read_config_file():
    file_path = 'DBConfig.cfg'

    if not os.path.isfile(file_path):
        print("ERROR: DBConfig file is created, fill all fields and restart server.")
        f = open('DBConfig.cfg', "w+")

        for i in DEFAULTCONFIG:
            f.write(i)

        f.close()
        exit(-1)
    DB_name = ''
    user_name = ''
    Password = ''
    Host = ''
    Port = ''
    Secret_key = ''

    with open(file_path) as fp:
        for line in fp:
            if line.startswith("NAME"):
                DB_name = line.split(':')[1].strip()
            if line.startswith("USERNAME"):
                user_name = line.split(':')[1].strip()
            if line.startswith("PASSWORD"):
                Password = line.split(':')[1].strip()
            if line.startswith("HOST"):
                Host = line.split(':')[1].strip()
            if line.startswith("PORT"):
                Port = line.split(':')[1].strip()
            if line.startswith("SECRET_KEY"):
                Secret_key = line.split(':')[1].strip()
    return [DB_name, user_name, Password, Host, Port, Secret_key]


class RequireLoginMiddleware(object):
    def __init__(self, get_response):
        self.urls = tuple([compile(url) for url in settings.LOGIN_REQUIRED_URLS])
        self.require_login_path = settings.LOGIN_URL
        self.get_response = get_response
        # One-time configuration and initialization.

    def __call__(self, request):
        # Code to be executed for each request before
        # the view (and later middleware) are called.
        response = self.get_response(request)

        user = get_user_model()
        try:
            is_admin = user.objects.get(pk=request.user.pk).is_superuser
            if is_admin:
                request.session['_auth_ip'] = get_client_ip(request)
                request.session.save()
        except (user.DoesNotExist, ValueError):
            pass
        # Code to be executed for each request/response after
        # the view is called.
        if not request.user.is_authenticated:
            for url in self.urls:
                if url.match(request.path):
                    return HttpResponseRedirect(self.require_login_path)

        return response