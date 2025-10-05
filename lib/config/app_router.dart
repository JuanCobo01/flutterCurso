import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/views/home_screen.dart';
import '../ui/views/async_demo_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/async',
      builder: (context, state) => const AsyncDemoScreen(),
    ),
  ],
);
