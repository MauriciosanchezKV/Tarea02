Tarea02

Aplicación móvil desarrollada en Flutter que implementa un sistema de autenticación de usuarios con manejo de estado global, persistencia de sesión y uso de recursos del dispositivo.

Descripción del proyecto

Esta aplicación permite a los usuarios:

- Registrarse en el sistema
- Iniciar sesión con usuario y contraseña
- Mantener la sesión activa de forma persistente
- Visualizar información personalizada del usuario
- Acceder a su perfil
- Obtener ubicación del dispositivo (GPS)


Arquitectura utilizada

El proyecto sigue una arquitectura sencilla basada en separación de responsabilidades:

services → lógica de negocio (auth, ubicación)
providers → estado global de la aplicación
screens → interfaz de usuario

Tecnologías utilizadas

- Flutter
- Dart
- Provider (gestión de estado)
- Flutter Secure Storage (almacenamiento seguro)
- Geolocator (geolocalización)



Funcionalidades principales

Autenticación
- Registro de usuarios
- Login con validación de credenciales

Sesión persistente
- Uso de token almacenado en SecureStorage
- Restauración automática de sesión al iniciar la app

Estado global
- Implementación con Provider
- Actualización reactiva de la interfaz

Perfil de usuario
- Visualización de datos del usuario autenticado
- Visualización del token de sesión

Geolocalización
- Solicitud de permisos del dispositivo
- Obtención de ubicación GPS bajo demanda

---

Seguridad

- Almacenamiento seguro de tokens con `flutter_secure_storage`
- Validación de acceso antes de mostrar pantallas protegidas
- Eliminación de datos sensibles al cerrar sesión

---

Permisos del sistema

La aplicación solicita permisos de ubicación:

- ACCESS_FINE_LOCATION
- ACCESS_COARSE_LOCATION

---

Cómo ejecutar el proyecto

1. Clonar el repositorio:
```bash
git clone https://github.com/TU_USUARIO/Tarea02.git
