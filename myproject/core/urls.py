from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('myproject.webPublic.urls')),
    path('management/empleados/', include('myproject.empleados.urls')),
    path('management/', include('myproject.management.urls')),
    path('management/eventos/', include('myproject.eventos.urls', namespace='eventos_admin')),
    path('management/planes/', include('myproject.planes.urls')),
    path('management/clientes/', include('myproject.clientes.urls')),
    path('management/configuracion', include('myproject.configuracion.urls')),
    path('management/calendario/', include('myproject.calendario.urls', namespace='calendario')),

]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)