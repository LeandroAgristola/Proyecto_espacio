import os
import sys  # <--- ¡Añade esta línea!

from django.core.wsgi import get_wsgi_application

# --- ¡Añade estas líneas de depuración! ---
print("--- DEBUG: Contenido de sys.path en wsgi.py ---")
for p in sys.path:
    print(p)
print("--- Fin DEBUG sys.path ---")
print(f"--- DEBUG: DJANGO_SETTINGS_MODULE en wsgi.py: {os.environ.get('DJANGO_SETTINGS_MODULE')} ---")
# ----------------------------------------

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'espacio.espacio.settings')

application = get_wsgi_application()