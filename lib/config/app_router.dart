import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../ui/views/home_screen.dart';
import '../ui/views/async_demo_screen.dart';
import '../ui/views/timer_demo.dart';
import '../ui/views/isolate_demo.dart';
import '../ui/views/calculator_screen.dart';
import '../ui/views/todo_list_screen.dart';
import '../ui/views/guess_game_screen.dart';
import '../ui/views/persistent_counter_screen.dart';

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
    GoRoute(
      path: '/timer',
      builder: (context, state) => const TimerDemo(),
    ),
    GoRoute(
      path: '/isolate',
      builder: (context, state) => const IsolateDemo(),
    ),
    GoRoute(
      path: '/calculator',
      builder: (context, state) => const CalculatorScreen(),
    ),
    GoRoute(
      path: '/todo',
      builder: (context, state) => const TodoListScreen(),
    ),
    GoRoute(
      path: '/guess-game',
      builder: (context, state) => const GuessGameScreen(),
    ),
    GoRoute(
      path: '/counter',
      builder: (context, state) => const PersistentCounterScreen(),
    ),
  ],
);
