import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/base_view.dart';

class DetalleScreen extends StatelessWidget {
  final String mensaje;
  final String metodo;

  const DetalleScreen({super.key, required this.mensaje, required this.metodo});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Detalle",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mensaje: $mensaje", style: const TextStyle(fontSize: 20)),
            Text("Navegación: $metodo"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (metodo == 'push') {
                  Navigator.of(context).pop();
                } else {
                  context.go('/');
                }
              },
              child: const Text("Volver"),
            )
          ],
        ),
      ),
    );
  }
}
