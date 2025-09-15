import 'package:go_router/go_router.dart';
import '../views/login_screen.dart';
import '../views/seats_screen.dart';
import '../views/checkout_screen.dart';

// aquí guardo las rutas de mi app
final appRouter = GoRouter(
  // pantalla inicial cuando abre la app
  initialLocation: '/',
  routes: [
    // ruta para login
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginScreen(),
    ),

    // ruta para asientos
    GoRoute(
      path: '/seats',
      builder: (context, state) => const SeatsScreen(),
    ),

    // ruta para checkout (pagar o confirmar)
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
    ),
  ],
);
