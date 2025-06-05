#!/usr/bin/env bash
set -o errexit

# Instala las dependencias. La ruta ya es correcta si build.sh está en la raíz.
pip install -r requirements.txt

# Ejecuta collectstatic (nota la ruta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (nota la ruta a manage.py)
python espacio/manage.py migrate

# Ejecuta el script de superusuario (nota la ruta al script)
python espacio/create_superuser.py