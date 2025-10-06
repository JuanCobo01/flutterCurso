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
            const Text(
              "Demostración de Asincronía en Flutter",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Botón para ir a la demo asíncrona
            ElevatedButton.icon(
              onPressed: () => context.push('/async'),
              icon: const Icon(Icons.sync),
              label: const Text("Ir a Demostración Async / Timer / Isolate"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}