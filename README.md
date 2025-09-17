#Prueba_Seleccion_Boletos_Tren

Aplicación móvil desarrollada en Flutter que permite a los usuarios iniciar sesión, seleccionar sus asientos en un tren y completar el proceso de compra.

Funcionalidades principales

Login simple para acceder a la aplicación.

Selección de asientos con estados: disponibles, no disponibles y seleccionados.

Vista de leyenda para que el usuario entienda el significado de cada icono.

Pantalla de checkout para continuar después de elegir los asientos.

Navegación con GoRouter para mover entre pantallas de manera sencilla.

Manejo de estado con Riverpod para controlar los asientos seleccionados y el login.

Estructura del proyecto
lib/
├── main.dart                # Punto de entrada de la app
├── routes/
│   └── app_router.dart      # Configuración de rutas con GoRouter
├── views/
│   ├── login_screen.dart    # Pantalla de inicio de sesión
│   ├── seats_screen.dart    # Pantalla de selección de asientos
│   └── checkout_screen.dart # Pantalla de confirmación/checkout
├── providers/
│   └── app_providers.dart   # Proveedores de estado con Riverpod
└── assets/                  # Imágenes usadas en la app (asientos, vagón, etc.)

Requisitos

Windows (probado en este sistema operativo)

Flutter SDK

Dart

Dependencias en pubspec.yaml:

flutter_riverpod

go_router

Cómo ejecutar

Clonar el repositorio.

Instalar dependencias:

flutter pub get


Ejecutar en Windows:

flutter run
