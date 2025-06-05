#!/usr/bin/env bash
set -o errexit

# Instala las dependencias.
pip install -r requirements.txt

# Ejecuta collectstatic (la ruta correcta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (la ruta correcta a manage.py)
python espacio/manage.py migrate

# Establece PYTHONPATH para que Python pueda encontrar tus aplicaciones
# Añade la carpeta 'espacio/' donde residen tus apps
export PYTHONPATH=$PYTHONPATH:./espacio/

# --- ¡NUEVAS LÍNEAS DE DIAGNÓSTICO PROFUNDO AQUÍ! ---
echo "--- Contenido DETALLADO de espacio/ (proyecto Django principal) ---"
ls -la espacio/
echo "--- Contenido DETALLADO de espacio/espacio/ (donde está settings.py) ---"
ls -la espacio/espacio/
# --- FIN DIAGNÓSTICO PROFUNDO ---


# Ejecuta el script de superusuario (la ruta explícita al script)
python ./create_superuser.py