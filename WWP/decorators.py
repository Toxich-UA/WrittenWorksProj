from django.http import HttpResponseRedirect

#the decorator
def wwp_login_required(f):
    def wrap(request, *args, **kwargs):
    #this check the session if userid key exist, if not it will redirect to login page
        if 'id' not in request.session.keys():
            return HttpResponseRedirect('/login/')
        return f(request, *args, **kwargs)
    wrap.__doc__=f.__doc__
    return wrap