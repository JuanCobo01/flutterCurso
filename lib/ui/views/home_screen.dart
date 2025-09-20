import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/base_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Menú Principal",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/detalle/Hola desde go/go'),
              child: const Text("Ir con GO"),
            ),
            ElevatedButton(
              onPressed: () => context.push('/detalle/Hola desde push/push'),
              child: const Text("Ir con PUSH"),
            ),
            ElevatedButton(
              onPressed: () => context.replace('/detalle/Hola desde replace/replace'),
              child: const Text("Ir con REPLACE"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/grid'),
              child: const Text("Ir a Grid + TabBar"),
            ),
            ElevatedButton(
              onPressed: () => context.push('/ciclo'),
              child: const Text("Ir al Ciclo de Vida"),
            ),
          ],
        ),
      ),
    );
  }
}
