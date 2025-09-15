import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/app_providers.dart';

// pantalla para confirmar la compra
class CheckoutScreen extends ConsumerWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // aquí traigo los asientos que seleccionó el usuario
    final seats = ref.watch(seatsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Confirmación de compra")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // mensaje de arriba
            const Text("Has seleccionado los asientos:"),

            // aquí muestro los números de asientos separados por coma
            Text(
              seats.join(", "),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // botón para terminar la compra y volver al inicio
            ElevatedButton(
              onPressed: () {
                // limpio los asientos seleccionados
                ref.read(seatsProvider.notifier).state = [];

                // regreso a la pantalla principal (login)
                context.go('/');
              },
              child: const Text("Finalizar y regresar al inicio"),
            ),
          ],
        ),
      ),
    );
  }
}