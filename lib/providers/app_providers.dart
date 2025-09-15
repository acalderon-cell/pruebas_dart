import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider para guardar si el usuario está logueado
final isLoggedProvider = StateProvider<bool>((ref) => false);

// Provider para los asientos seleccionados
final seatsProvider = StateProvider<List<int>>((ref) => []);
