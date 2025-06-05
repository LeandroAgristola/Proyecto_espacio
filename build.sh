#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

# Añade la ruta absoluta de la raíz del proyecto al PYTHONPATH
# Esto asegura que Python encuentre el paquete 'espacio' y sus sub-aplicaciones.
export PYTHONPATH=$PYTHONPATH:/opt/render/project/src/ 

# Ejecuta collectstatic
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones
python espacio/manage.py migrate

# Ejecuta el script de superusuario
python ./create_superuser.py