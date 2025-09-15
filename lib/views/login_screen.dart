import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/app_providers.dart';

// Pantalla de inicio de sesión
class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // aquí va la estructura principal
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Center(
        // botón que hace el login
        child: ElevatedButton(
          onPressed: () {
            // cuando doy click, digo que ya está logueado
            ref.read(isLoggedProvider.notifier).state = true;

            // después me manda a la pantalla de asientos
            context.go('/seats');
          },
          // texto que se ve en el botón
          child: const Text("Iniciar Sesión"),
        ),
      ),
    );
  }
}