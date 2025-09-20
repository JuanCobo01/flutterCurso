import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Menú Navegación", style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () => context.go('/'),
          ),
          ListTile(
            title: const Text("Grid + Tabs"),
            onTap: () => context.go('/grid'),
          ),
          ListTile(
            title: const Text("Ciclo de Vida"),
            onTap: () => context.go('/ciclo'),
          ),
        ],
      ),
    );
  }
}
