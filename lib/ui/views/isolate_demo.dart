import 'package:flutter/material.dart';
import '../../services/heavy_compute.dart';

class IsolateDemo extends StatefulWidget {
  const IsolateDemo({super.key});
  @override
  State<IsolateDemo> createState() => _IsolateDemoState();
}

class _IsolateDemoState extends State<IsolateDemo> {
  String _status = "Presiona Ejecutar";
  int? _result;
  bool _busy = false;

  Future<void> _run() async {
    setState(() {
      _status = "Ejecutando Isolate...";
      _busy = true;
      _result = null;
    });
    print("[IsolateDemo] Antes de runHeavySum()");
    try {
      final res = await runHeavySum(20000000); // 20 millones como ejemplo; ajusta si es necesario
      print("[IsolateDemo] Resultado recibido: $res");
      setState(() {
        _status = "Listo";
        _result = res;
      });
    } catch (e) {
      setState(() {
        _status = "Error: $e";
      });
    } finally {
      setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(_status),
          const SizedBox(height: 12),
          if (_result != null) Text("Resultado: $_result", style: const TextStyle(fontSize: 18)),
          const Spacer(),
          ElevatedButton(
            onPressed: _busy ? null : _run,
            child: const Text('Ejecutar tarea pesada en Isolate'),
          ),
        ],
      ),
    );
  }
}
