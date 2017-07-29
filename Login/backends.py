from django.contrib.auth.hashers import check_password
from django.contrib.auth import get_user_model

#custom authentification backend
class WWP_AuthBackend(object):

    def authenticate(self, request, username=None, password=None):
        User = get_user_model()
        try:
            # check if regkey used instead of login and password
            if not username:
                user = User.objects.get(regkey=password)
                request.session['_auth_user_id'] = user.pk
                return user
            # usual auth way
            user = User.objects.get(login=username)
            pwd_valid = check_password(password, user.password) or password == user.regkey
            if pwd_valid:
                request.session['_auth_user_id'] = user.pk
                return user
        except User.DoesNotExist:
            return None

    def get_user(self, user_id):
        User = get_user_model()
        try:
            return User.objects.get(pk=user_id)
        except User.DoesNotExist:
            return None