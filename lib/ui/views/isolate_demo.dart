import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
      final res = await runHeavySum(20000000); // 20 millones como ejemplo
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo de Isolate'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.go('/'), // 🔙 volver a HomeScreen
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // centra verticalmente todo el contenido
          crossAxisAlignment:
              CrossAxisAlignment.center, // centra horizontalmente el texto
          children: [
            Center(
              child: Text(
                _status,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 12),
            if (_result != null)
              Text(
                "Resultado: $_result",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 40), // separa un poco antes del botón
            ElevatedButton(
              onPressed: _busy ? null : _run,
              child: _busy
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        SizedBox(width: 10),
                        Text('Procesando...'),
                      ],
                    )
                  : const Text('Ejecutar tarea pesada en Isolate'),
            ),
          ],
        ),
      ),
    );
  }
}
