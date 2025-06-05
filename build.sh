#!/usr/bin/env bash
set -o errexit

# Instala las dependencias.
pip install -r requirements.txt

# Ejecuta collectstatic (la ruta correcta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (la ruta correcta a manage.py)
python espacio/manage.py migrate

# Establece PYTHONPATH para que Python pueda encontrar tus aplicaciones (ej. webPublic)
# La ruta '.' se refiere al directorio actual (la raíz de tu repositorio en Render)
export PYTHONPATH=$PYTHONPATH:.

# Ejecuta el script de superusuario (la ruta explícita al script)
python ./create_superuser.py