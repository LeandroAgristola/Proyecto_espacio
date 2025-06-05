#!/usr/bin/env bash
set -o errexit

# Instala las dependencias.
pip install -r requirements.txt

# Ejecuta collectstatic (la ruta correcta a manage.py)
python espacio/manage.py collectstatic --noinput

# Ejecuta migraciones (la ruta correcta a manage.py)
python espacio/manage.py migrate

# --- ¡NUEVO CAMBIO CRUCIAL AQUÍ! ---
# Establece PYTHONPATH para que Python pueda encontrar tus aplicaciones (ej. webPublic).
# Añade la carpeta 'espacio/' al PYTHONPATH, ya que tus apps están directamente dentro de ella.
export PYTHONPATH=$PYTHONPATH:./espacio/

# --- DIAGNÓSTICO TEMPORAL: LISTAR CONTENIDO PARA VERIFICAR RUTAS ---
# Esto listará el contenido de la carpeta 'espacio/' y de la raíz del proyecto.
# Nos ayudará a confirmar si las carpetas se ven como esperamos en Render.
echo "--- Contenido de la raíz del proyecto (/opt/render/project/src/) ---"
ls -la .
echo "--- Contenido de la carpeta espacio/ (/opt/render/project/src/espacio/) ---"
ls -la espacio/
# --- FIN DIAGNÓSTICO TEMPORAL ---


# Ejecuta el script de superusuario (la ruta explícita al script)
python ./create_superuser.py