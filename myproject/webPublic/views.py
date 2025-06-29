from django.shortcuts import render
from myproject.empleados.models import Empleado
from myproject.eventos.models import Evento
from myproject.planes.models import Plan
from myproject.configuracion.models import Configuracion

def home(request):
    planes = Plan.objects.filter(mostrar_en_web=True, activo=True)
    empleados = Empleado.objects.filter(mostrar_en_web=True, activo=True).values(
        'nombre', 'instagram', 'imagen_perfil')
    configuracion = Configuracion.objects.first()
    
    return render(request, 'webPublic/home.html', {
        'planes': planes,
        'empleados': empleados,
        'configuracion': configuracion
    })

def eventos(request):
    eventos = Evento.objects.filter(mostrar_en_web=True, estado=True)
    configuracion = Configuracion.objects.first()
    return render(request, 'webPublic/eventos.html', {
        'eventos': eventos,
        'configuracion': configuracion
    })
