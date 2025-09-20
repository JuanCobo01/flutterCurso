import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/views/home_screen.dart';
import '../ui/views/detalle_screen.dart';
import '../ui/views/grid_tab_screen.dart';
import '../ui/views/ciclo_vida_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/detalle/:mensaje/:metodo',
      builder: (context, state) {
        final mensaje = state.pathParameters['mensaje']!;
        final metodo = state.pathParameters['metodo']!;
        return DetalleScreen(mensaje: mensaje, metodo: metodo);
      },
    ),
    GoRoute(
      path: '/grid',
      builder: (context, state) => const GridTabScreen(),
    ),
    GoRoute(
      path: '/ciclo',
      builder: (context, state) => const CicloVidaScreen(),
    ),
  ],
);
