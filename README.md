# App Boletos Tren

Aplicación móvil desarrollada en **Flutter** que permite a los usuarios iniciar sesión, seleccionar sus asientos en un tren y completar el proceso de compra.  
Probado en **Windows**.

---

## Características

- Pantalla de **login simple**  
- **Selección de asientos** con tres estados: disponibles, no disponibles y seleccionados  
- **Leyenda visual** que explica los iconos de los asientos  
- Pantalla de **checkout** para continuar después de elegir asientos  
- **Navegación con GoRouter**  
- **Gestión de estado con Riverpod**  

---

## Estructura del proyecto

```plaintext
lib/
├── main.dart                # Punto de entrada de la aplicación
├── routes/
│   └── app_router.dart      # Configuración de rutas
├── views/
│   ├── login_screen.dart    # Pantalla de inicio de sesión
│   ├── seats_screen.dart    # Pantalla de selección de asientos
│   └── checkout_screen.dart # Pantalla de checkout
├── providers/
│   └── app_providers.dart   # Providers de estado
└── assets/                  # Imágenes usadas en la app (asientos, vagón, etc.)
```

## Requisitos

- **Windows** (probado en este sistema operativo)
- **Flutter SDK**
- **Dart**

### Dependencias principales en pubspec.yaml:
- `flutter_riverpod`
- `go_router`

## Ejecución

1. **Clonar este repositorio**
   ```bash
   git clone https://github.com/acalderon-cell/pruebas_dart.git
   ```

2. **Instalar dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecutar en Windows**
   ```bash
   flutter run
   ```
