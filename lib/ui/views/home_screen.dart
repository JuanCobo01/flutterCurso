import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/base_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Flutter Curso - UCEVA",
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            
            // Header
            const Text(
              "🚀 Aplicación Flutter Completa",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              "Versión 1.0.2 - Nuevas funcionalidades agregadas",
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            
            const SizedBox(height: 30),

            // Features grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: [
                  _buildFeatureCard(
                    context,
                    '⚡ Async Demos',
                    'Timer, Future, Isolate',
                    '/async',
                    Colors.blue,
                  ),
                  _buildFeatureCard(
                    context,
                    '🧮 Calculadora',
                    'Operaciones básicas',
                    '/calculator',
                    Colors.orange,
                  ),
                  _buildFeatureCard(
                    context,
                    '📋 Lista de Tareas',
                    'Organiza tus pendientes',
                    '/todo',
                    Colors.green,
                  ),
                  _buildFeatureCard(
                    context,
                    '🎲 Juego de Adivinanza',
                    'Adivina el número',
                    '/guess-game',
                    Colors.purple,
                  ),
                  _buildFeatureCard(
                    context,
                    '🔢 Contador',
                    'Contador inteligente',
                    '/counter',
                    Colors.red,
                  ),
                  _buildFeatureCard(
                    context,
                    '⏱️ Timer Demo',
                    'Cronómetro avanzado',
                    '/timer',
                    Colors.teal,
                  ),
                  _buildFeatureCard(
                    context,
                    '🏛️ Universidades',
                    'Gestión de universidades',
                    '/universidades',
                    Colors.blue,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            
            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    '📱 Desarrollado con Flutter',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Juan David Cobo Aguirre - UCEVA',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(BuildContext context, String title, String subtitle, String route, Color color) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => context.push(route),
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.1),
                color.withOpacity(0.05),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  _getIconForRoute(route),
                  color: color,
                  size: 32,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForRoute(String route) {
    switch (route) {
      case '/async':
        return Icons.sync;
      case '/calculator':
        return Icons.calculate;
      case '/todo':
        return Icons.checklist;
      case '/guess-game':
        return Icons.casino;
      case '/counter':
        return Icons.add_circle;
      case '/universidades':
        return Icons.school;
      case '/timer':
        return Icons.timer;
      default:
        return Icons.apps;
    }
  }
}