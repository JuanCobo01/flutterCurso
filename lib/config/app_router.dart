import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/views/universidades/lista_universidades_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ListaUniversidadesScreen(),
    ),
  ],
);
