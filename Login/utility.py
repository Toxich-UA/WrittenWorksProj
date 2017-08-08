PROFILE_URL_PATTERN = '/profile/{}/'
ERROR_TEMPLATE = 'Login/error.html'

LOGIN_TEMPLATE = 'Login/login.html'
FIRST_ACCESS_TEMPLATE = 'Login/first_access.html'

REGISTRATION_TEMPLATE = 'Login/registration.html'


def get_client_ip(request):
    x_forwarded_for = request.META.get('HTTP_X_FORWARDED_FOR')
    if x_forwarded_for:
        ip = x_forwarded_for.split(',')[0].strip()
    else:
        ip = request.META.get('REMOTE_ADDR')
    return ip
