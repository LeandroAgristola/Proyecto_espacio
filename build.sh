#!/usr/bin/env bash
set -o errexit

# Instala las dependencias.
pip install -r requirements.txt

# Ejecuta collectstatic (la ruta correcta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (la ruta correcta a manage.py)
python espacio/manage.py migrate

# --- CAMBIO CRUCIAL AQUÍ ---
# Establece PYTHONPATH para que Python pueda encontrar tus aplicaciones.
# Añade la raíz del repositorio (.), Y la subcarpeta 'espacio/apps'.
export PYTHONPATH=$PYTHONPATH:.:espacio/apps

# --- DIAGNÓSTICO TEMPORAL: LISTAR CONTENIDO PARA VERIFICAR RUTAS ---
# Esto listará el contenido de la carpeta 'espacio/apps' y de la raíz del proyecto.
# Nos ayudará a confirmar si las carpetas se ven como esperamos en Render.
echo "--- Contenido de la raíz del proyecto ---"
ls -la .
echo "--- Contenido de espacio/apps ---"
ls -la espacio/apps
# --- FIN DIAGNÓSTICO TEMPORAL ---


# Ejecuta el script de superusuario (la ruta explícita al script)
python ./create_superuser.py