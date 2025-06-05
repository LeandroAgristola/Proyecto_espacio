import os
import django

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'espacio.settings')
django.setup()

from django.contrib.auth import get_user_model

User = get_user_model()

if not User.objects.filter(username=os.environ.get('SUPERUSER_USERNAME')).exists():
    User.objects.create_superuser(
        os.environ.get('SUPERUSER_USERNAME'),
        os.environ.get('SUPERUSER_EMAIL'),
        os.environ.get('SUPERUSER_PASSWORD')
    )
    print("Superusuario creado!")
else:
    print("Superusuario ya existe")