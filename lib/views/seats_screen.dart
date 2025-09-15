import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/app_providers.dart';

// Pantalla de los asientos
class SeatsScreen extends ConsumerWidget {
  const SeatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // aquí guardo los asientos seleccionados
    final seats = ref.watch(seatsProvider);

    // tamaño que voy a usar para los asientos
    const double seatSize = 40;

    return Scaffold(
      appBar: AppBar(title: const Text("Selecciona tus asientos")),
      body: Column(
        children: [
          const SizedBox(height: 12),

          // pongo la imagen del vagón arriba
          Image.asset("assets/vagoon.png", width: 100, height: 50),

          const SizedBox(height: 12),

          // aquí muestro qué significa cada icono
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              LegendItem(icon: "assets/seat_available.png", label: "Disponible"),
              LegendItem(icon: "assets/seat_unavailable.png", label: "No disponible"),
              LegendItem(icon: "assets/seat_selected.png", label: "Tu asiento"),
            ],
          ),

          const SizedBox(height: 16),

          // aquí hago el listado de filas de asientos
          Expanded(
            child: ListView.builder(
              itemCount: 10, // puse 10 filas de asientos
              itemBuilder: (context, fila) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // lado izquierdo
                      SeatWidget(index: fila * 4, seatSize: seatSize),
                      const SizedBox(width: 12),
                      SeatWidget(index: fila * 4 + 1, seatSize: seatSize),

                      // pasillo en medio
                      const SizedBox(width: 40),

                      // lado derecho
                      SeatWidget(index: fila * 4 + 2, seatSize: seatSize),
                      const SizedBox(width: 12),
                      SeatWidget(index: fila * 4 + 3, seatSize: seatSize),
                    ],
                  ),
                );
              },
            ),
          ),

          // botón para ir a la siguiente pantalla
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                // si seleccionó al menos un asiento, va a checkout
                if (seats.isNotEmpty) {
                  context.go('/checkout');
                } else {
                  // si no, le digo que seleccione uno
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Selecciona al menos un asiento")),
                  );
                }
              },
              child: const Text("SIGUIENTE", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

// este widget es para cada asiento individual
class SeatWidget extends ConsumerWidget {
  final int index;
  final double seatSize;

  const SeatWidget({super.key, required this.index, required this.seatSize});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // obtengo los asientos seleccionados
    final seats = ref.watch(seatsProvider);

    // verifico si este asiento ya está seleccionado
    final isSelected = seats.contains(index);

    // hago que cada asiento que es múltiplo de 7 sea "no disponible"
    final isUnavailable = index % 7 == 0;

    // según el estado del asiento muestro la imagen correspondiente
    String seatImg;
    if (isSelected) {
      seatImg = "assets/seat_selected.png";
    } else if (isUnavailable) {
      seatImg = "assets/seat_unavailable.png";
    } else {
      seatImg = "assets/seat_available.png";
    }

    return GestureDetector(
      onTap: () {
        // solo dejo tocar si no está ocupado
        if (!isUnavailable) {
          final seatsNotifier = ref.read(seatsProvider.notifier);

          // si ya estaba seleccionado lo quito, si no lo agrego
          if (isSelected) {
            seatsNotifier.state = List.from(seatsNotifier.state)..remove(index);
          } else {
            seatsNotifier.state = List.from(seatsNotifier.state)..add(index);
          }
        }
      },
      child: Image.asset(seatImg, width: seatSize, height: seatSize),
    );
  }
}

// esto es solo para mostrar la leyenda de los asientos
class LegendItem extends StatelessWidget {
  final String icon;
  final String label;

  const LegendItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, width: 20, height: 20),
        const SizedBox(width: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
