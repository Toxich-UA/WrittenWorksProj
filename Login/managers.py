from django.contrib.auth.base_user import BaseUserManager

#Manager definition for django user customization
class UserManager(BaseUserManager):
    use_in_migrations = True

    def _create_user(self, login, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not login:
            raise ValueError('The given login must be set')
        user = self.model(login=login, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self, login, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(login, password, **extra_fields)

    def create_superuser(self, login, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)

        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')

        return self._create_user(login, password, **extra_fields)
