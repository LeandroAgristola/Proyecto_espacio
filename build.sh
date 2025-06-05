#!/usr/bin/env bash
set -o errexit

pip install -r requirements.txt

# CRÍTICO: Añade la raíz del repositorio al PYTHONPATH.
# Esto asegura que Python pueda encontrar el paquete de nivel superior 'espacio'
# y así resolver 'espacio.espacio' y también 'webPublic' directamente dentro del primer 'espacio'.
export PYTHONPATH=$PYTHONPATH:.

# Ejecuta collectstatic
python manage.py collectstatic --noinput

# Ejecuta migraciones
python manage.py migrate

# Ejecuta el script de superusuario
python create_superuser.py