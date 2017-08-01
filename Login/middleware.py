from django.conf import settings
from django.contrib.auth import get_user_model
from django.http import HttpResponseRedirect
from re import compile
from Login.utility import get_client_ip


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