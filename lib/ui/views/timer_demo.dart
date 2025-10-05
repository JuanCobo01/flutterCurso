import 'dart:async';
import 'package:flutter/material.dart';

class TimerDemo extends StatefulWidget {
  const TimerDemo({super.key});
  @override
  State<TimerDemo> createState() => _TimerDemoState();
}

class _TimerDemoState extends State<TimerDemo> {
  Timer? _timer;
  int _milliseconds = 0;
  bool _running = false;

  void _start() {
    if (_running) return;
    _running = true;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      setState(() => _milliseconds += 100);
    });
  }

  void _pause() {
    _timer?.cancel();
    _timer = null;
    _running = false;
  }

  void _resume() {
    if (_running) return;
    _running = true;
    _timer = Timer.periodic(const Duration(milliseconds: 100), (t) {
      setState(() => _milliseconds += 100);
    });
  }

  void _reset() {
    _pause();
    setState(() => _milliseconds = 0);
  }

  String _format(int ms) {
    final s = (ms / 1000).floor();
    final min = (s ~/ 60).toString().padLeft(2, '0');
    final sec = (s % 60).toString().padLeft(2, '0');
    final cent = ((ms % 1000) / 100).floor().toString();
    return "$min:$sec.$cent";
  }

  @override
  void dispose() {
    _timer?.cancel(); // limpieza obligatoria
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(_format(_milliseconds),
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Wrap(
            spacing: 8,
            children: [
              ElevatedButton(onPressed: _start, child: const Text('Iniciar')),
              ElevatedButton(onPressed: _pause, child: const Text('Pausar')),
              ElevatedButton(onPressed: _resume, child: const Text('Reanudar')),
              ElevatedButton(onPressed: _reset, child: const Text('Reiniciar')),
            ],
          ),
        ],
      ),
    );
  }
}
