#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

# ESTO ES CLAVE: Añade la carpeta 'espacio/' (donde residen manage.py y tus apps) al PYTHONPATH.
# Esto permite que Python encuentre 'webPublic' y otras apps directamente.
export PYTHONPATH=$PYTHONPATH:./espacio/

# Ejecuta collectstatic
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones
python espacio/manage.py migrate

# Ejecuta el script de superusuario
# Asegúrate de que esta sea la ruta correcta: ahora es 'espacio/create_superuser.py'
python ./create_superuser.py