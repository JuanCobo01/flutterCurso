import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Menú de Navegación',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () => context.go('/'),
          ),
          ListTile(
            leading: const Icon(Icons.hourglass_bottom),
            title: const Text('Demostración Async'),
            onTap: () => context.push('/async'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.timer),
            title: const Text('Cronómetro'),
            onTap: () {
              // en caso de que luego se agregue ruta /timer
              context.push('/timer');
            },
          ),
          ListTile(
            leading: const Icon(Icons.memory),
            title: const Text('Tarea Pesada (Isolate)'),
            onTap: () {
              // en caso de que luego se agregue ruta /isolate
              context.push('/isolate');
            },
          ),
        ],
      ),
    );
  }
}