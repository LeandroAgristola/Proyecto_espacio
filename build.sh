#!/usr/bin/env bash
set -o errexit

# Instala las dependencias. La ruta ya es correcta si build.sh está en la raíz.
pip install -r requirements.txt

# Ejecuta collectstatic (nota la ruta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (nota la ruta a manage.py)
python espacio/manage.py migrate

# Establece PYTHONPATH para que Python pueda encontrar 'espacio.settings'
# La ruta '.' se refiere al directorio actual, que es la raíz del repositorio
export PYTHONPATH=$PYTHONPATH:.

# Ejecuta el script de superusuario (nota la ruta al script)
python ./create_superuser.py