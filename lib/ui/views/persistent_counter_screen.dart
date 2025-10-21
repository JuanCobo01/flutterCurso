import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PersistentCounterScreen extends StatefulWidget {
  const PersistentCounterScreen({super.key});

  @override
  State<PersistentCounterScreen> createState() => _PersistentCounterScreenState();
}

class _PersistentCounterScreenState extends State<PersistentCounterScreen> {
  int _counter = 0;
  int _totalClicks = 0;
  int _sessions = 1;
  DateTime? _lastResetTime;

  @override
  void initState() {
    super.initState();
    _lastResetTime = DateTime.now();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _totalClicks++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _totalClicks++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
      _sessions++;
      _lastResetTime = DateTime.now();
    });
  }

  void _multiplyCounter() {
    setState(() {
      _counter *= 2;
      _totalClicks++;
    });
  }

  Color _getCounterColor() {
    if (_counter == 0) return Colors.grey;
    if (_counter > 0) return Colors.green;
    return Colors.red;
  }

  String _getCounterEmoji() {
    if (_counter == 0) return '😐';
    if (_counter > 0 && _counter <= 10) return '😊';
    if (_counter > 10 && _counter <= 50) return '🎉';
    if (_counter > 50) return '🚀';
    if (_counter < 0 && _counter >= -10) return '😕';
    return '💀';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🔢 Contador Inteligente'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Main counter display
            Expanded(
              flex: 3,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _getCounterEmoji(),
                      style: const TextStyle(fontSize: 60),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '$_counter',
                      style: TextStyle(
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                        color: _getCounterColor(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _counter == 0 
                          ? 'Empezamos desde cero'
                          : _counter > 0 
                              ? '¡Vamos subiendo!'
                              : 'En números rojos',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Statistics section
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '📊 Estadísticas de la sesión',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildStatCard('Total de clics', _totalClicks.toString(), Icons.touch_app),
                        _buildStatCard('Sesiones', _sessions.toString(), Icons.refresh),
                        _buildStatCard('Valor máximo', _counter > 0 ? _counter.toString() : '0', Icons.trending_up),
                      ],
                    ),
                    if (_lastResetTime != null) ...[
                      const SizedBox(height: 10),
                      Text(
                        'Último reinicio: ${_lastResetTime!.hour}:${_lastResetTime!.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Action buttons
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // Primary actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _decrementCounter,
                          icon: const Icon(Icons.remove),
                          label: const Text('Restar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _incrementCounter,
                          icon: const Icon(Icons.add),
                          label: const Text('Sumar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Secondary actions
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _counter != 0 ? _multiplyCounter : null,
                          icon: const Icon(Icons.close),
                          label: const Text('x2'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: _resetCounter,
                          icon: const Icon(Icons.refresh),
                          label: const Text('Reset'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[700],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // Fun facts
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.lightbulb_outline, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          _counter == 42 
                              ? '¡La respuesta a todo!' 
                              : _counter == 100 
                                  ? '¡Número redondo!' 
                                  : _counter < 0 
                                      ? 'En territorio negativo' 
                                      : 'Sigue contando...',
                          style: const TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 24, color: Theme.of(context).primaryColor),
        const SizedBox(height: 5),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}