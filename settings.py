import environ
import os
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent

# Initialise environment
env = environ.Env()
environ.Env.read_env(os.path.join(BASE_DIR, '.env'))

# SECRET KEY
SECRET_KEY = env('SECRET_KEY')

# DEBUG (optional)
DEBUG = env.bool('DEBUG', default=False)

# DATABASES example
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': env('DATABASE_NAME'),
        'USER': env('DATABASE_USER'),
        'PASSWORD': env('DATABASE_PASS'),
        'HOST': env('DATABASE_IP'),
        'PORT': '5432',
    }
}

# ALLOWED_HOSTS example
ALLOWED_HOSTS = ['*']
