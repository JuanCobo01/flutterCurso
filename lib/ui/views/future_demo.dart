import 'package:flutter/material.dart';
import '../../services/fake_api_service.dart';

class FutureDemo extends StatefulWidget {
  const FutureDemo({super.key});
  @override
  State<FutureDemo> createState() => _FutureDemoState();
}

class _FutureDemoState extends State<FutureDemo> {
  final FakeApiService api = FakeApiService();

  String _status = "Presiona 'Cargar' para iniciar";
  String? _data;

  Future<void> _loadData({bool fail = false}) async {
    print("[FutureDemo] Antes de llamar fetchData()");
    setState(() {
      _status = "Cargando...";
      _data = null;
    });

    try {
      final res = await api.fetchData(fail: fail); // espera sin bloquear UI
      print("[FutureDemo] Después de await fetchData()");
      setState(() {
        _status = "Éxito";
        _data = res;
      });
    } catch (e, st) {
      print("[FutureDemo] Error capturado: $e\n$st");
      setState(() {
        _status = "Error: ${e.toString()}";
        _data = null;
      });
    } finally {
      print("[FutureDemo] Finally ejecutado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(_status, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 12),
          if (_data != null) Text(_data!, style: const TextStyle(fontSize: 16)),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(onPressed: () => _loadData(), child: const Text('Cargar')),
              ElevatedButton(onPressed: () => _loadData(fail: true), child: const Text('Forzar Error')),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}