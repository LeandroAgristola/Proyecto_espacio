#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

# Correctly adds the project root to PYTHONPATH, allowing Django to find 'espacio.webPublic'
export PYTHONPATH=$PYTHONPATH:.

# Ejecuta collectstatic
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones
python espacio/manage.py migrate

# Ejecuta el script de superusuario
# Asegúrate de que esta sea la ruta correcta: ahora es 'espacio/create_superuser.py'
python ./create_superuser.py