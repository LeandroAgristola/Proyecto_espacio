#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

# Añade la carpeta 'espacio/' (donde reside manage.py y tus apps) al PYTHONPATH.
# Esto permite que Python encuentre tus apps directamente.
export PYTHONPATH=$PYTHONPATH:./espacio/

# Ejecuta collectstatic
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones
python espacio/manage.py migrate

# Ejecuta el script de superusuario
python ./create_superuser.py