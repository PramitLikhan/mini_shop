import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mini_shop/router/app_pages.dart';
import 'package:mini_shop/screens/cart/cart_screen.dart';

import '../screens/home/home_screen.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;
  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Text(error?.toString() ?? 'Page not found.'),
        ),
      );
}

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppPages.home,
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      GoRoute(
        path: AppPages.home,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppPages.cart,
        name: 'cart',
        builder: (BuildContext context, GoRouterState state) => const CartScreen(),
      ),
    ],
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
  );
}
