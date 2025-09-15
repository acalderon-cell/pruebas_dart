import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/app_router.dart';

// función principal de la app
void main() {
  // ProviderScope es para usar Riverpod en toda la app
  runApp(const ProviderScope(child: MyApp()));
}

// este es el widget principal de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // aquí pongo MaterialApp con router
    return MaterialApp.router(
      // título de la app
      title: 'App Boletos Tren',
      // uso la configuración de rutas que hice en otro archivo
      routerConfig: appRouter,
    );
  }
}
