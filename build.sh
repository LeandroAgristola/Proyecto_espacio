#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

export PYTHONPATH=$PYTHONPATH:. # This is for manage.py to find 'myproject'

# Ejecuta collectstatic
python manage.py collectstatic --noinput 

# Ejecuta migraciones
python manage.py migrate 

# Ejecuta el script de superusuario
python create_superuser.py 